# CBass

BASS is an audio library (written in C and C++) developed by Un4seen Developments. See [un4seen.com](https://www.un4seen.com) for downloads, documentation, licensing terms, and a User Forum.

CBass is a Swift package that seamlessly integrates the BASS audio library and its extensive collection of extensions into your Swift projects. With CBass, you can harness the power of BASS's robust audio capabilities with the ease and convenience of Swift.



## Modules

CBass provides pre-built Swift **modules** for the following BASS **extensions** and **add-ons**:

<details>
<summary> Bass 2.14.17 </summary>

The Main APIs of Bass which includes the `bass.xcframework` & `libbass.xcframeworks` binaries and the public `bass.h` header.

</details>


<details>
<summary> BASSFLAC 2.4.5.5 </summary>

 An extension enabling the playback of [FLAC](https://xiph.org/flac) 
 (including Ogg FLAC) encoded files and streams.

</details>


<details>
<summary> BASSMIDI 2.4.14.1 </summary>

 An extension enabling the playback of MIDI files and custom event sequences, using SF2 and 
 SFZ soundfonts to provide the sounds, including support for SF2PACK and
 SF3 compressed soundfonts. MIDI input is also supported.
 
 A couple of SF2 soundfonts are available [here](https://www.un4seen.com/download.php?x/ChoriumRevA)
 and [here](https://www.un4seen.com/download.php?x/WeedsGM3).
 
</details>


<details>
<summary> BASSWV 2.4.7.4 </summary>

 An extension enabling the playback of [WavPack](https://www.wavpack.com/)
 encoded files and streams, including WavPack DSD files when used with the BASSDSD add-on.
 
</details>


<details>
<summary> BASSOPUS 2.4.2.4 </summary>

An extension enabling the playback of [Opus](https://opus-codec.org/) encoded files and streams.
 
</details>


<details>
<summary> BASSDSD 2.4.1.3 </summary>

 An extension enabling the playback of **DSD (Direct Stream Digital)** data in
 `DSDIFF` and `DSF` containers, and WavPack when used with the `BASSWV` add-on.
 Includes `raw DSD` and `DSD-over-PCM` output options.
 
</details>


<details>
<summary> BASSALAC 2.4.0.3 </summary>

 An extension enabling the playback of [WebM](https://www.webmproject.org/) and
 [Matroska](https://www.matroska.org/) files and streams.
 
</details>


<details>
<summary> BASSWEBM 2.4.0.3 </summary>

 An extension enabling the playback of [WebM](https://www.webmproject.org/) and
 [Matroska](https://www.matroska.org/) files and streams.
 
</details>


<details>
<summary> BASSHLS 2.4.4 </summary>

 An extension enabling the playback of **HLS (HTTP Live Streaming)** streams.
 Local media playlists and segments are also supported.
 
</details>


<details>
<summary> BASSAPE 2.4 </summary>

An extension enabling the playback of [Monkey's Audio](https://monkeysaudio.com) encoded files.
 
</details>


<details>
<summary> BASSmix 2.4.12 </summary>

 An extension providing the ability to mix together multiple BASS channels,
 with resampling and matrix mixing features.
 Also provides the ability to split a BASS channel into multiple channels.
 
</details>


<details>
<summary> BASSenc 2.4.16.1 </summary>

 An extension that allows BASS channels to be encoded using command-line encoders with
 `STDIN` support, or ACM codecs (on Windows) or CoreAudio codecs (on `macOS/iOS`),
 or user-provided encoders.
 Also features streaming of encoded data to clients directly or via Shoutcast and 
 Icecast servers, and `PCM` `WAV/AIFF` file writing.
 
</details>


<details>
<summary> BASSenc_MP3 2.4.1.6 </summary>

An extension to `BASSenc` that provides MP3 encoding of BASS channels, with support for `LAME` options.
 
</details>


<details>
<summary> BASSenc_FLAC 2.4.4.1 </summary>

 An extension to BASSenc that provides [FLAC](https://xiph.org/flac/) encoding of
 BASS channels, including support for Ogg FLAC and chained bitstreams.
 
</details>


<details>
<summary> BASSenc_OGG 2.4.2 </summary>

 An extension to BASSenc that provides [Ogg Vorbis](https://xiph.org/vorbis/)
 encoding of BASS channels, with support for OGGENC options and chained bitstreams.
 
</details>


<details>
<summary> BASSenc_OPUS 2.4.3 </summary>

 An extension to BASSenc that provides [Opus](https://opus-codec.org/) encoding of
 BASS channels, with support for OPUSENC options and chained bitstreams.
 
</details>


<details>
<summary> BASSloud 2.4 </summary>

An extension providing loudness measurement of BASS channels.
 
</details>


### More add-ons


<details>
<summary> BASS FX 2.4.12.6 </summary>

An extension providing several effects, including reverse playback and tempo & pitch control.
 
</details>


<details>
<summary> BASS_MPC 2.4.1.2 </summary>

An extension enabling the playback of [Musepack](https://www.musepack.net/) encoded files and streams.
 
</details>


<details>
<summary> BASS_TTA 2.4.0.2 </summary>

An extension enabling the playback of [TTA](http://tta.tausoft.org) encoded files.
 
</details>


<details>
<summary> BASS_SPX 2.4.3.2 </summary>

 An extension enabling the playback of [Speex](https://www.speex.org) encoded files.
 
 **MacOS Only**
 
</details>


<details>
<summary> BASS_VST 2.4.1 </summary>

 An extension enabling the use of VST effects and instruments with BASS.
 
 **MacOS Only**
 
</details>


<details>
<summary> Tags 19 </summary>

 An extension producing formatted **text** from the 
 `ID3v1/v2`, `OGG/FLAC`, `WMA`, `APE`, `MP4`, and `RIFF` tags of a BASS stream.
 
</details>



## Usage

To import BASS into your Xcode project, click on "File | Add Package Dependencies...".  In the resultant pop-up window, type "github.com/Teatra11/CBass" as the repository url, and click on "Add Package".  Then type "import CBass" at the top of any class in the project using BASS library commands.

To be clear, the CBass Swift Package wrapper is open source, but the wrapper's contents (mainly the files bass.xcframework, libbass.xcframework, bass.h, bridge.c, and bridge.h) are proprietary to Un4seen Developments. Usage of these files is free for non-commercial use.  Commercial developers should contact Un4seen Developments to arrange proper licensing.
