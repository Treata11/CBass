/*
	BASSenc_FLAC 2.4 C/C++ header file
	Copyright (c) 2017-2020 Un4seen Developments Ltd.

	See the BASSENC_FLAC.CHM file for more detailed documentation
*/

#ifndef BASSENC_FLAC_H
#define BASSENC_FLAC_H

#include "bassenc.h"

#if BASSVERSION!=0x204
#error conflicting BASS and BASSenc_FLAC versions
#endif

#ifdef __OBJC__
typedef int BOOL32;
#define BOOL BOOL32 // override objc's BOOL
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifndef BASSENCFLACDEF
#define BASSENCFLACDEF(f) WINAPI f
#endif

// BASS_Encode_FLAC_NewStream flags
#define BASS_ENCODE_FLAC_RESET		0x1000000

DWORD BASSENCFLACDEF(BASS_Encode_FLAC_GetVersion)(void);

HENCODE BASSENCFLACDEF(BASS_Encode_FLAC_Start)(DWORD handle, const char *options, DWORD flags, ENCODEPROCEX *proc, void *user);
HENCODE BASSENCFLACDEF(BASS_Encode_FLAC_StartFile)(DWORD handle, const char *options, DWORD flags, const char *filename);
BOOL BASSENCFLACDEF(BASS_Encode_FLAC_NewStream)(HENCODE handle, const char *options, DWORD flags);

#ifdef __cplusplus
}

#ifdef _WIN32
static inline HENCODE BASS_Encode_FLAC_Start(DWORD handle, const WCHAR *options, DWORD flags, ENCODEPROCEX *proc, void *user)
{
	return BASS_Encode_FLAC_Start(handle, (const char*)options, flags|BASS_UNICODE, proc, user);
}

static inline HENCODE BASS_Encode_FLAC_StartFile(DWORD handle, const WCHAR *options, DWORD flags, const WCHAR *filename)
{
	return BASS_Encode_FLAC_StartFile(handle, (const char*)options, flags|BASS_UNICODE, (const char*)filename);
}

static inline BOOL BASS_Encode_FLAC_NewStream(HENCODE handle, const WCHAR *options, DWORD flags)
{
	return BASS_Encode_FLAC_NewStream(handle, (const char*)options, flags | BASS_UNICODE);
}
#endif
#endif

#endif
