/******************************************************************************
* TtsEngObj.h *
*-------------*
*  This is the header file for the sample CTTSEngObj class definition.
*------------------------------------------------------------------------------
*  Copyright (c) Microsoft Corporation. All rights reserved.
*
******************************************************************************/
#ifndef TtsEngObj_h
#define TtsEngObj_h

//--- Additional includes
#ifndef __TtsEng_h__
#include "ttseng.h"
#endif
#include <stdio.h>
#include "ttsapi.h"

#ifndef SPDDKHLP_h
#include <spddkhlp.h>
#endif

#ifndef SPCollec_h
#include <spcollec.h>
#endif

#include "resource.h"

#define NUMBUFFERS 8
#define BUFFERSIZE 1024

/*** CTTSEngObj COM object ********************************
*/
class ATL_NO_VTABLE CTTSEngObj : 
public CComObjectRootEx<CComMultiThreadModel>,
public CComCoClass<CTTSEngObj, &CLSID_SampleTTSEngine>,
public ISpTTSEngine,
public ISpObjectWithToken
{
	/*=== ATL Setup ===*/
public:
	DECLARE_REGISTRY_RESOURCEID(IDR_SAMPLETTSENGINE)
	DECLARE_PROTECT_FINAL_CONSTRUCT()

	BEGIN_COM_MAP(CTTSEngObj)
	COM_INTERFACE_ENTRY(ISpTTSEngine)
	COM_INTERFACE_ENTRY(ISpObjectWithToken)
	END_COM_MAP()

	/*=== Methods =======*/
public:
	/*--- Constructors/Destructors ---*/
	HRESULT FinalConstruct();
	void FinalRelease();

	/*=== Interfaces ====*/
public:
	//--- ISpObjectWithToken ----------------------------------
	STDMETHODIMP SetObjectToken( ISpObjectToken * pToken );
	STDMETHODIMP GetObjectToken( ISpObjectToken ** ppToken )
	{ return SpGenericGetObjectToken( ppToken, m_cpToken ); }


	//--- ISpTTSEngine --------------------------------------------
	STDMETHOD(Speak)( DWORD dwSpeakFlags,
	REFGUID rguidFormatId, const WAVEFORMATEX * pWaveFormatEx,
	const SPVTEXTFRAG* pTextFragList, ISpTTSEngineSite* pOutputSite );
	STDMETHOD(GetOutputFormat)( const GUID * pTargetFormatId, const WAVEFORMATEX * pTargetWaveFormatEx,
	GUID * pDesiredFormatId, WAVEFORMATEX ** ppCoMemDesiredWaveFormatEx );


	/*=== Member Data ===*/
private:
	CComPtr<ISpObjectToken> m_cpToken;
	ISpTTSEngineSite *m_OutputSite;

	//Convert SAPI parameters to DECtalk parameters
	long SAPI2DTRate(long rate, long BassRate);
	long SAPI2DTPitch(long pitch, long BassPitch);
	long SAPI2DTRange(long range, long BassRange);

	//Handle to DECtalk
	LPTTS_HANDLE_T engine;

	//This stores some Info about the engine
	TTS_CAPS_T caps;

	//Output buffer
	UINT BufferMessage;
	TTS_BUFFER_T buffer[NUMBUFFERS];
	short samples[BUFFERSIZE][NUMBUFFERS];

	//DECtalk callback
	static void callback(LONG LParam1, LONG lParam2, DWORD user, UINT msg);

	//DECtalk settings
	DWORD m_voice;
	DWORD m_rate;
	DWORD m_language;

	//Volume hack
	double gain;

	//Try to not spam the synth with repeated command strings
	bool SpellingMode;
	long LastRate;
	long LastPitch;
	long LastRange;
};

#endif //--- This must be the last line in the file
