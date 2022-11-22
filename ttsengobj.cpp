/*******************************************************************************
* TtsEngObj.cpp *
*---------------*
*   Description:
*       This module is the main implementation file for the CTTSEngObj class.
*-------------------------------------------------------------------------------
*  Creation Date: 03/24/99
*  Copyright (c) Microsoft Corporation. All rights reserved.
*  All Rights Reserved
*
*******************************************************************************/

//--- Additional includes
#include "stdafx.h"
#include "TtsEngObj.h"
#include "SMITS5.C"

//--- Local

//DECtalk pitch table
static const short PitchTable[9] =
{
	122,
	208,
	89,
	155,
	110,
	296,
	240,
	106,
	200
};

//DECtalk range table
static const short RangeTable[9] =
{
	100,
	240,
	80,
	90,
	135,
	180,
	135,
	80,
	175
};

//Convert SAPI rate to DECtalk rate
long CTTSEngObj::SAPI2DTRate(long rate, long BassRate)
{
	long NewRate = BassRate + (rate * 40);
	if(NewRate > (long)caps.dwMaximumSpeakingRate)
	{
		NewRate = caps.dwMaximumSpeakingRate;
	}
	else if(NewRate < (long)caps.dwMinimumSpeakingRate)
	{
		NewRate = caps.dwMinimumSpeakingRate;
	}
	return NewRate;
}

//Convert SAPI pitch to DECtalk pitch
long CTTSEngObj::SAPI2DTPitch(long pitch, long BassPitch)
{
	long NewPitch = BassPitch + (pitch * 10);
	if(NewPitch > 350)
	{
		NewPitch = 350;
	}
	else if(NewPitch < 50)
	{
		NewPitch = 50;
	}
	return NewPitch;
}

//Convert SAPI range to DECtalk range
long CTTSEngObj::SAPI2DTRange(long range, long BassRange)
{
	long NewRange = BassRange + (range * 10);
	if(NewRange > 250)
	{
		NewRange = 250;
	}
	else if(NewRange < 0)
	{
		NewRange = 0;
	}
	return NewRange;
}

//DECtalk callback
void CTTSEngObj::callback(LONG LParam1, LONG lParam2, DWORD user, UINT msg)
{
	CTTSEngObj *SAPI = (CTTSEngObj*)user;
	if(!SAPI || !SAPI->m_OutputSite)
	{
		return;
	}
	if(SAPI->m_OutputSite->GetActions() & SPVES_ABORT)
	{
		LPTTS_BUFFER_T buffer = (LPTTS_BUFFER_T)lParam2;
		TextToSpeechAddBuffer(SAPI->engine, buffer);
		return;
	}
	if(msg == SAPI->BufferMessage)
	{
		LPTTS_BUFFER_T buffer = (LPTTS_BUFFER_T)lParam2;
		for(DWORD i = 0; i < buffer->dwBufferLength/sizeof(short); i++)
		{
			double dsamp = SAPI->samples[i] / 32768.0;
			dsamp = dsamp * SAPI->gain;
			dsamp = dsamp * 32768.0;
			SAPI->samples[i] = (short)dsamp;
		}
		SAPI->m_OutputSite->Write(SAPI->samples, buffer->dwBufferLength, NULL);
		TextToSpeechAddBuffer(SAPI->engine, buffer);
	}
}

/*****************************************************************************
* CTTSEngObj::FinalConstruct *
*----------------------------*
*   Description:
*       Constructor
*****************************************************************************/
HRESULT CTTSEngObj::FinalConstruct()
{
	HRESULT hr = S_OK;

	m_OutputSite = NULL;
	engine = NULL;

	memset(&caps, 0, sizeof(caps));
	memset(&buffer, 0, sizeof(buffer));
	memset(samples, 0, sizeof(samples));

	//Get some Info about the engine
	TextToSpeechGetCaps(&caps);

	//Initialize DECtalk
	DT$OpenMem();
	TextToSpeechStartupEx(&engine, WAVE_MAPPER, DO_NOT_USE_AUDIO_DEVICE, callback, (LONG)this);
	if(!engine)
	{
		return hr;
	}

	//Set up buffer
	BufferMessage = RegisterWindowMessage("DECtalkBufferMessage");
	buffer.lpData = (LPSTR)samples;
	buffer.dwMaximumBufferLength = sizeof(samples);
	TextToSpeechOpenInMemory(engine, WAVE_FORMAT_1M16);
	TextToSpeechAddBuffer(engine, &buffer);

	//Enable phonemic Input, the silence and emphasis tags use this
	TextToSpeechSpeak(engine, "[:phone on]", TTS_NORMAL);

	gain = 0;
	SpellingMode = false;
	LastRate = 0;
	LastPitch = 0;
	LastRange = 0;

	return hr;
} /* CTTSEngObj::FinalConstruct */

/*****************************************************************************
* CTTSEngObj::FinalRelease *
*--------------------------*
*   Description:
*       destructor
*****************************************************************************/
void CTTSEngObj::FinalRelease()
{

	//Shutdown DECtalk
	if(engine)
	{
		TextToSpeechUnloadUserDictionary(engine);
		TextToSpeechCloseInMemory(engine);
		TextToSpeechShutdown(engine);
		engine = NULL;
	}
	DT$CloseMem();

	m_OutputSite = NULL;

	memset(&caps, 0, sizeof(caps));
	memset(&buffer, 0, sizeof(buffer));
	memset(samples, 0, sizeof(samples));

} /* CTTSEngObj::FinalRelease */

//
//=== ISpObjectWithToken Implementation ======================================
//

/*****************************************************************************
* CTTSEngObj::SetObjectToken *
*----------------------------*
*   Description:
*       This function performs the majority of the initialization of the voice.
*   Once the object token has been provided, the filenames are read from the
*   token key and the files are mapped.
*****************************************************************************/
STDMETHODIMP CTTSEngObj::SetObjectToken(ISpObjectToken * pToken)
{
	HRESULT hr = SpGenericSetObjectToken(pToken, m_cpToken);

	if( SUCCEEDED( hr ) )
	{
		if(!engine)
		{
			return hr;
		}
		//Set default settings
		m_voice = 0;
		m_rate = 180;

		//Load settings from the token
		m_cpToken->GetDWORD( L"Voice", &m_voice);
		m_cpToken->GetDWORD( L"Rate", &m_rate);

		//Check if we are in a valid range for m_voice
		if(m_voice > WENDY)
		{
			m_voice = WENDY;
		}
		else if(m_voice < PAUL)
		{
			m_voice = PAUL;
		}

		//Set default voice
		TextToSpeechSetSpeaker(engine, m_voice);

		//Check if we are in a valid range for m_rate
		if(m_rate > caps.dwMaximumSpeakingRate)
		{
			m_rate = caps.dwMaximumSpeakingRate;
		}
		else if(m_rate < caps.dwMinimumSpeakingRate)
		{
			m_rate = caps.dwMinimumSpeakingRate;
		}

		//Set default rate
		TextToSpeechSetRate(engine, m_rate);

		//Load a user dictionary
		WCHAR *filename = NULL;
		m_cpToken->GetStringValue(L"UserDict", &filename);
		if(filename)
		{
			long strsize = WideCharToMultiByte(CP_ACP, 0, filename, -1, NULL, 0, NULL, NULL);
			char *dictpath = (char *)malloc(strsize+1);
			if(dictpath)
			{
				dictpath[strsize] = 0;
				WideCharToMultiByte(CP_ACP, 0, filename, -1, dictpath, strsize, NULL, NULL);
				TextToSpeechLoadUserDictionary(engine, dictpath);
				free(dictpath);
			}
		}
	}

	return hr;
} /* CTTSEngObj::SetObjectToken */

//
//=== ISpTTSEngine Implementation ============================================
//

/*****************************************************************************
* CTTSEngObj::Speak *
*-------------------*
*   Description:
*       This is the primary method that SAPI calls to render text.
*-----------------------------------------------------------------------------
*   Input Parameters
*
*   pUser
*       Pointer to the current user profile object. This object contains
*       information like what languages are being used and this object
*       also gives access to resources like the SAPI master lexicon object.
*
*   dwSpeakFlags
*       This is a set of flags used to control the behavior of the
*       SAPI voice object and the associated engine.
*
*   VoiceFmtIndex
*       Zero based index specifying the output format that should
*       be used during rendering.
*
*   pTextFragList
*       A linked list of text fragments to be rendered. There is
*       one fragement per XML state change. If the input text does
*       not contain any XML markup, there will only be a single fragment.
*
*   pOutputSite
*       The interface back to SAPI where all output audio samples and events are written.
*
*   Return Values
*       S_OK - This should be returned after successful rendering or if
*              rendering was interrupted because *pfContinue changed to FALSE.
*       E_INVALIDARG 
*       E_OUTOFMEMORY
*
*****************************************************************************/
STDMETHODIMP CTTSEngObj::Speak( DWORD dwSpeakFlags,
REFGUID rguidFormatId,
const WAVEFORMATEX * pWaveFormatEx,
const SPVTEXTFRAG* pTextFragList,
ISpTTSEngineSite* pOutputSite )
{
	HRESULT hr = S_OK;

	//--- Check args
	if( SP_IS_BAD_INTERFACE_PTR( pOutputSite ) ||
			SP_IS_BAD_READ_PTR( pTextFragList )  )
	{
		hr = E_INVALIDARG;
	}
	else
	{
		if(!engine)
		{
			return hr;
		}
		m_OutputSite = pOutputSite;

		while(pTextFragList != NULL)
		{

			//Stop speech
			if( pOutputSite->GetActions() & SPVES_ABORT )
			{
				TextToSpeechReset(engine, FALSE);
				return hr;
			}

			//Set DECtalk voice parameters
			TextToSpeechGetSpeaker(engine, &m_voice);
			long rate = 0;
			pOutputSite->GetRate(&rate);
			rate += pTextFragList->State.RateAdj;
			long NewDTRate = SAPI2DTRate(rate, m_rate);
			unsigned short volume = 100;
			pOutputSite->GetVolume(&volume);
			volume = (volume * (unsigned short)pTextFragList->State.Volume) / 100;
			gain = volume / 100.0;
			if(gain > 1)
			{
				gain = 1;
			}
			else if(gain < 0)
			{
				gain = 0;
			}
			long NewDTPitch = SAPI2DTPitch(pTextFragList->State.PitchAdj.MiddleAdj, PitchTable[m_voice]);
			long NewDTRange = SAPI2DTRange(pTextFragList->State.PitchAdj.RangeAdj, RangeTable[m_voice]);
			if(NewDTRate != LastRate || NewDTPitch != LastPitch || NewDTRange != LastRange)
			{
				LastRate = NewDTRate;
				LastPitch = NewDTPitch;
				LastRange = NewDTRange;
				char params[64];
				memset(params, 0, sizeof(params));
				sprintf(params, "[:ra %d :dv ap %d pr %d]", NewDTRate, NewDTPitch, NewDTRange);
				TextToSpeechSpeak(engine, params, TTS_NORMAL);
			}

			//Emphasis
			if(pTextFragList->State.EmphAdj)
			{
				TextToSpeechSpeak(engine, "[\"]", TTS_NORMAL);
			}

			//--- Do skip?
			if( pOutputSite->GetActions() & SPVES_SKIP )
			{
				long lSkipCnt;
				SPVSKIPTYPE eType;
				hr = pOutputSite->GetSkipInfo( &eType, &lSkipCnt );
				if( SUCCEEDED( hr ) )
				{
					//--- Notify SAPI how many items we skipped. We're returning zero
					//    because this feature isn't implemented.
					hr = pOutputSite->CompleteSkip( 0 );
				}
			}

			switch(pTextFragList->State.eAction)
			{

			case SPVA_Speak:
				{
					//Disable spelling mode
					if(SpellingMode)
					{
						TextToSpeechSpeak(engine, "[:mode spell off]", TTS_NORMAL);
						SpellingMode = false;
					}
					//Convert Unicode text to ANSI for DECtalk
					long strsize = WideCharToMultiByte(CP_ACP, 0, pTextFragList->pTextStart, pTextFragList->ulTextLen, NULL, 0, NULL, NULL);
					char *text2speak = (char *)malloc(strsize+1);
					if(text2speak)
					{
						text2speak[strsize] = 0;
						WideCharToMultiByte(CP_ACP, 0, pTextFragList->pTextStart, pTextFragList->ulTextLen, text2speak, strsize, NULL, NULL);
						TextToSpeechSpeak(engine, text2speak, TTS_NORMAL);
						free(text2speak);
					}
					//Hack for the shark, which sends each word as It's own fragment!
					TextToSpeechSpeak(engine, " ", TTS_NORMAL);
					break;
				}

			case SPVA_SpellOut:
				{
					//Enable spelling mode
					if(!SpellingMode)
					{
						TextToSpeechSpeak(engine, "[:mode spell on]", TTS_NORMAL);
						SpellingMode = true;
					}
					//Convert Unicode text to ANSI for DECtalk
					long strsize = WideCharToMultiByte(CP_ACP, 0, pTextFragList->pTextStart, pTextFragList->ulTextLen, NULL, 0, NULL, NULL);
					char *text2speak = (char *)malloc(strsize+1);
					if(text2speak)
					{
						text2speak[strsize] = 0;
						WideCharToMultiByte(CP_ACP, 0, pTextFragList->pTextStart, pTextFragList->ulTextLen, text2speak, strsize, NULL, NULL);
						TextToSpeechSpeak(engine, text2speak, TTS_NORMAL);
						free(text2speak);
					}
					//Hack for the shark, which sends each word as It's own fragment!
					TextToSpeechSpeak(engine, " ", TTS_NORMAL);
					break;
				}

			case SPVA_Silence:
				{
					//Insert a pause
					char silence[64];
					memset(silence, 0, sizeof(silence));
					sprintf(silence, "[_<%d>]", pTextFragList->State.SilenceMSecs);
					TextToSpeechSpeak(engine, silence, TTS_NORMAL);
					break;
				}

				//--- Fire a bookmark event ---------------------------------
			case SPVA_Bookmark:
				{
					//--- The bookmark is NOT a null terminated string in the Item, but we need
					//--- to convert it to one.  Allocate enough space for the string.
					WCHAR * pszBookmark = (WCHAR *)_alloca((pTextFragList->ulTextLen + 1) * sizeof(WCHAR));
					memcpy(pszBookmark, pTextFragList->pTextStart, pTextFragList->ulTextLen * sizeof(WCHAR));
					pszBookmark[pTextFragList->ulTextLen] = 0;
					//--- Queue the event
					SPEVENT Event;
					Event.eEventId             = SPEI_TTS_BOOKMARK;
					Event.elParamType          = SPET_LPARAM_IS_STRING;
					Event.ullAudioStreamOffset = 0;
					Event.lParam               = (LPARAM)pszBookmark;
					Event.wParam               = _wtol(pszBookmark);
					hr = pOutputSite->AddEvents( &Event, 1 );
					break;
				}

			}
			pTextFragList = pTextFragList->pNext;
		}

		//Synthesize text
		TextToSpeechSpeak(engine, "", TTS_FORCE);

		//Wait for synthesis to complete
		TextToSpeechSync(engine);

		//Set m_OutputSite to NULL so the callback doesn't do anything outside the loop
		m_OutputSite = NULL;

		//--- S_FALSE just says that we hit the end, return okay
		if( hr == S_FALSE )
		{
			hr = S_OK;
		}
	}

	return hr;
} /* CTTSEngObj::Speak */

/*****************************************************************************
* CTTSEngObj::GetVoiceFormat *
*----------------------------*
*   Description:
*       This method returns the output data format associated with the
*   specified format Index. Formats are in order of quality with the best
*   starting at 0.
*****************************************************************************/
STDMETHODIMP CTTSEngObj::GetOutputFormat( const GUID * pTargetFormatId, const WAVEFORMATEX * pTargetWaveFormatEx,
GUID * pDesiredFormatId, WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx )
{
	HRESULT hr = S_OK;

	if(!engine)
	{
		return hr;
	}
	hr = SpConvertStreamFormatEnum(SPSF_11kHz16BitMono, pDesiredFormatId, ppCoMemDesiredWaveFormatEx);

	return hr;
} /* CTTSEngObj::GetVoiceFormat */
