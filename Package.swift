// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBass",
    
    platforms: [.iOS(.v13), .macOS(.v12)],
    
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CBass",
            targets: ["CBass"]
        ),
        .library(
            name: "Bass",
            targets: ["Bass"]
        ),
        .library(
            name: "BassFLAC",
            targets: ["BassFLAC"]
        ),
        .library(
            name: "BassMIDI",
            targets: ["BassMIDI"]
        ),
        .library(
            name: "BassWV",
            targets: ["BassWV"]
        ),
        .library(
            name: "BassOpus",
            targets: ["BassOpus"]
        ),
        .library(
            name: "BassDSD",
            targets: ["BassDSD"]
        ),
        .library(
            name: "BassWebM",
            targets: ["BassWebM"]
        ),
        .library(
            name: "BassHLS",
            targets: ["BassHLS"]
        ),
        .library(
            name: "BassMix",
            targets: ["BassMix"]
        ),
        .library(
            name: "BassENC",
            targets: ["BassENC"]
        ),
        .library(
            name: "BassENC.MP3",
            targets: ["BassENC.MP3"]
        ),
        .library(
            name: "BassENC.FLAC",
            targets: ["BassENC.FLAC"]
        ),
        .library(
            name: "BassENC.OGG",
            targets: ["BassENC.OGG"]
        ),
        .library(
            name: "BassENC.Opus",
            targets: ["BassENC.Opus"]
        ),
        .library(
            name: "BassLoud",
            targets: ["BassLoud"]
        ),
        .library(
            name: "BassApe",
            targets: ["BassApe"]
        ),
        .library(
            name: "BassFX",
            targets: ["BassFX"]
        ),
        .library(
            name: "BassMPC",
            targets: ["BassMPC"]
        ),
        .library(
            name: "BassTTA",
            targets: ["BassTTA"]
        ),
        .library(
            name: "BassSPX",
            targets: ["BassSPX"]
        ),
        .library(
            name: "BassVST",
            targets: ["BassVST"]
        ),
        .library(
            name: "Tags",
            targets: ["Tags"]
        )
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        
        // FIXME: Fails to import any of the dependent modules
        /// The target which has all the other targets as its dependencies.
        /// Importing this module would result in the importing of all the other modules.
        .target(
            name: "CBass",
            dependencies: [
                .target(name: "Bass"),
                .target(name: "BassFLAC"),
                .target(name: "BassMIDI"),
                .target(name: "BassWV"),
                .target(name: "BassOpus"),
                .target(name: "BassDSD"),
                .target(name: "BassWebM"),
                .target(name: "BassHLS"),
                .target(name: "BassApe"),
                .target(name: "BassMix"),
                .target(name: "BassENC"),
                .target(name: "BassENC.MP3"),
                .target(name: "BassENC.FLAC"),
                .target(name: "BassENC.OGG"),
                .target(name: "BassENC.Opus"),
                .target(name: "BassLoud"),
                .target(name: "BassFX"),
                .target(name: "BassMPC"),
                .target(name: "BassTTA"),
                .target(name: "BassSPX", condition: .when(platforms: [.macOS])),
                .target(name: "BassVST", condition: .when(platforms: [.macOS])),
                .target(name: "Tags")
            ],
            path: "Sources/CBass"
        ),
        
        // MARK: - BASS
        .target(
            name: "Bass",
            dependencies: [
                .target(name: "bass", condition: .when(platforms: [.iOS])),
                .target(name: "libbass", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/Bass"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bass",
            path: "./Frameworks/bass.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbass",
            path: "./Frameworks/libbass.xcframework"
        ),
        
        // MARK: - BASS FLAC
        /**
         An extension enabling the playback of [FLAC](https://xiph.org/flac) 
         (including Ogg FLAC) encoded files and streams.
         */
        .target(
            name: "BassFLAC",
            dependencies: [
                .target(name: "bassflac", condition: .when(platforms: [.iOS])),
                .target(name: "libbassflac", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassFLAC"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassflac",
            path: "./Frameworks/bassflac.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassflac",
            path: "./Frameworks/libbassflac.xcframework"
        ),
        
        // MARK: - BASS MIDI
        /**
         An extension enabling the playback of MIDI files and custom event sequences, using SF2 and 
         SFZ soundfonts to provide the sounds, including support for SF2PACK and
         SF3 compressed soundfonts. MIDI input is also supported.
         
         A couple of SF2 soundfonts are available [here](https://www.un4seen.com/download.php?x/ChoriumRevA)
         and [here](https://www.un4seen.com/download.php?x/WeedsGM3).
         */
        .target(
            name: "BassMIDI",
            dependencies: [
                .target(name: "bassmidi", condition: .when(platforms: [.iOS])),
                .target(name: "libbassmidi", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassMIDI"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassmidi",
            path: "./Frameworks/bassmidi.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassmidi",
            path: "./Frameworks/libbassmidi.xcframework"
        ),
        
        // MARK: - BASS WV
        /**
         An extension enabling the playback of [WavPack](https://www.wavpack.com/)
         encoded files and streams, including WavPack DSD files when used with the BASSDSD add-on.
         */
        .target(
            name: "BassWV",
            dependencies: [
                .target(name: "basswv", condition: .when(platforms: [.iOS])),
                .target(name: "libbasswv", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassWV"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "basswv",
            path: "./Frameworks/basswv.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbasswv",
            path: "./Frameworks/libbasswv.xcframework"
        ),
        
        // MARK: - BASS Opus
        /**
         An extension enabling the playback of [Opus](https://opus-codec.org/) encoded files and streams.
         */
        .target(
            name: "BassOpus",
            dependencies: [
                .target(name: "bassopus", condition: .when(platforms: [.iOS])),
                .target(name: "libbassopus", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassOpus"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassopus",
            path: "./Frameworks/bassopus.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassopus",
            path: "./Frameworks/libbassopus.xcframework"
        ),
        
        // MARK: - BASS DSD
        /**
         An extension enabling the playback of **DSD (Direct Stream Digital)** data in
         `DSDIFF` and `DSF` containers, and WavPack when used with the `BASSWV` add-on.
         Includes `raw DSD` and `DSD-over-PCM` output options.
         */
        .target(
            name: "BassDSD",
            dependencies: [
                .target(name: "bassdsd", condition: .when(platforms: [.iOS])),
                .target(name: "libbassdsd", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassDSD"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassdsd",
            path: "./Frameworks/bassdsd.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassdsd",
            path: "./Frameworks/libbassdsd.xcframework"
        ),
        
        
        // MARK: - BASS WebM
        /**
         An extension enabling the playback of [WebM](https://www.webmproject.org/) and
         [Matroska](https://www.matroska.org/) files and streams.
         */
        .target(
            name: "BassWebM",
            dependencies: [
                .target(name: "basswebm", condition: .when(platforms: [.iOS])),
                .target(name: "libbasswebm", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassWebM"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "basswebm",
            path: "./Frameworks/basswebm.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbasswebm",
            path: "./Frameworks/libbasswebm.xcframework"
        ),
        
        // MARK: - BASS HLS
        /**
         An extension enabling the playback of **HLS (HTTP Live Streaming)** streams.
         Local media playlists and segments are also supported.
         */
        .target(
            name: "BassHLS",
            dependencies: [
                .target(name: "basshls", condition: .when(platforms: [.iOS])),
                .target(name: "libbasshls", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassHLS"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "basshls",
            path: "./Frameworks/basshls.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbasshls",
            path: "./Frameworks/libbasshls.xcframework"
        ),
        
        // MARK: - Bass Ape
        /**
         An extension enabling the playback of [Monkey's Audio](https://monkeysaudio.com) encoded files.
         */
        .target(
            name: "BassApe",
            dependencies: [
                .target(name: "bassape", condition: .when(platforms: [.iOS])),
                .target(name: "libbassape", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/bassape"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassape",
            path: "./Frameworks/bassape.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassape",
            path: "./Frameworks/libbassape.xcframework"
        ),
        
        // MARK: - Bass Mix
        /**
         An extension providing the ability to mix together multiple BASS channels,
         with resampling and matrix mixing features.
         Also provides the ability to split a BASS channel into multiple channels.
         */
        .target(
            name: "BassMix",
            dependencies: [
                .target(name: "bassmix", condition: .when(platforms: [.iOS])),
                .target(name: "libbassmix", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassMix"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassmix",
            path: "./Frameworks/bassmix.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassmix",
            path: "./Frameworks/libbassmix.xcframework"
        ),
        
        // MARK: - Bass ENC
        /**
         An extension that allows BASS channels to be encoded using command-line encoders with
         `STDIN` support, or ACM codecs (on Windows) or CoreAudio codecs (on `macOS/iOS`),
         or user-provided encoders.
         Also features streaming of encoded data to clients directly or via Shoutcast and 
         Icecast servers, and `PCM` `WAV/AIFF` file writing.
         */
        .target(
            name: "BassENC",
            dependencies: [
                .target(name: "bassenc", condition: .when(platforms: [.iOS])),
                .target(name: "libbassenc", condition: .when(platforms: [.macOS])),
                // Extensions of BassENC
                .target(name: "BassENC.MP3"),
                .target(name: "BassENC.FLAC"),
                .target(name: "BassENC.OGG"),
                .target(name: "BassENC.Opus")
            ],
            path: "Sources/BassENC"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassenc",
            path: "./Frameworks/bassenc.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassenc",
            path: "./Frameworks/libbassenc.xcframework"
        ),
        
        // MARK: - Bass ENC MP3
        /**
         An extension to `BASSenc` that provides MP3 encoding of BASS channels, with support for `LAME` options.
         */
        .target(
            name: "BassENC.MP3",
            dependencies: [
                .target(name: "bassenc_mp3", condition: .when(platforms: [.iOS])),
                .target(name: "libbassenc_mp3", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassENC_MP3"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassenc_mp3",
            path: "./Frameworks/bassenc_mp3.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassenc_mp3",
            path: "./Frameworks/libbassenc_mp3.xcframework"
        ),
        
        // MARK: - Bass ENC FLAC
        /**
         An extension to BASSenc that provides [FLAC](https://xiph.org/flac/) encoding of
         BASS channels, including support for Ogg FLAC and chained bitstreams.
         */
        .target(
            name: "BassENC.FLAC",
            dependencies: [
                .target(name: "bassenc_flac", condition: .when(platforms: [.iOS])),
                .target(name: "libbassenc_flac", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassENC_FLAC"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassenc_flac",
            path: "./Frameworks/bassenc_flac.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassenc_flac",
            path: "./Frameworks/libbassenc_flac.xcframework"
        ),
        
        // MARK: - Bass ENC OGG
        /**
         An extension to BASSenc that provides [Ogg Vorbis](https://xiph.org/vorbis/)
         encoding of BASS channels, with support for OGGENC options and chained bitstreams.
         */
        .target(
            name: "BassENC.OGG",
            dependencies: [
                .target(name: "bassenc_ogg", condition: .when(platforms: [.iOS])),
                .target(name: "libbassenc_ogg", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassENC_OGG"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassenc_ogg",
            path: "./Frameworks/bassenc_ogg.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassenc_ogg",
            path: "./Frameworks/libbassenc_ogg.xcframework"
        ),
        
        // MARK: - Bass ENC Opus
        /**
         An extension to BASSenc that provides [Opus](https://opus-codec.org/) encoding of
         BASS channels, with support for OPUSENC options and chained bitstreams.
         */
        .target(
            name: "BassENC.Opus",
            dependencies: [
                .target(name: "bassenc_opus", condition: .when(platforms: [.iOS])),
                .target(name: "libbassenc_opus", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/bassenc_opus"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassenc_opus",
            path: "./Frameworks/bassenc_opus.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassenc_opus",
            path: "./Frameworks/libbassenc_opus.xcframework"
        ),
        
        // MARK: - Bass Loud
        /**
         An extension providing loudness measurement of BASS channels.
         */
        .target(
            name: "BassLoud",
            dependencies: [
                .target(name: "bassloud", condition: .when(platforms: [.iOS])),
                .target(name: "libbassloud", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/bassloud"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bassloud",
            path: "./Frameworks/bassloud.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbassloud",
            path: "./Frameworks/libbassloud.xcframework"
        ),
        
        
        
    // MARK: - More Add-Ons -
        
        
        
        // MARK: - BASS FX
        /**
         An extension providing several effects, including reverse playback and tempo & pitch control.
         */
        .target(
            name: "BassFX",
            dependencies: [
                .target(name: "bass_fx", condition: .when(platforms: [.iOS])),
                .target(name: "libbass_fx", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassFX"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bass_fx",
            path: "./Frameworks/bass_fx.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbass_fx",
            path: "./Frameworks/libbass_fx.xcframework"
        ),
        
        
        // MARK: - BASS MPC
        /**
         An extension enabling the playback of [Musepack](https://www.musepack.net/) encoded files and streams.
         */
        .target(
            name: "BassMPC",
            dependencies: [
                .target(name: "bass_mpc", condition: .when(platforms: [.iOS])),
                .target(name: "libbass_mpc", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassMPC"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bass_mpc",
            path: "./Frameworks/bass_mpc.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbass_mpc",
            path: "./Frameworks/libbass_mpc.xcframework"
        ),
        
        // MARK: - Bass TTA
        /**
         An extension enabling the playback of [TTA](http://tta.tausoft.org) encoded files.
         */
        .target(
            name: "BassTTA",
            dependencies: [
                .target(name: "bass_tta", condition: .when(platforms: [.iOS])),
                .target(name: "libbass_tta", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassTTA"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "bass_tta",
            path: "./Frameworks/bass_tta.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbass_tta",
            path: "./Frameworks/libbass_tta.xcframework"
        ),
        
        // MARK: - Bass SPX
        /**
         An extension enabling the playback of [Speex](https://www.speex.org) encoded files.
         
         ***MacOS Only**
         */
        .target(
            name: "BassSPX",
            dependencies: [
                .target(name: "libbass_spx", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassSPX"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbass_spx",
            path: "./Frameworks/libbass_spx.xcframework"
        ),
        
        // MARK: - Bass VST
        /**
         An extension enabling the use of VST effects and instruments with BASS.
         
         ***MacOS Only**
         */
        .target(
            name: "BassVST",
            dependencies: [
                .target(name: "libbass_vst", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/BassVST"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libbass_vst",
            path: "./Frameworks/libbass_vst.xcframework"
        ),
        
        // MARK: - Tags
        /**
         An extension producing formatted **text** from the 
         `ID3v1/v2`, `OGG/FLAC`, `WMA`, `APE`, `MP4`, and `RIFF` tags of a BASS stream.
         */
        .target(
            name: "Tags",
            dependencies: [
                .target(name: "tags", condition: .when(platforms: [.iOS])),
                .target(name: "libtags", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/Tags"
        ),
        /// The **iOS** binary target
        .binaryTarget(
            name: "tags",
            path: "./Frameworks/tags.xcframework"
        ),
        /// The **macOS** binary target
        .binaryTarget(
            name: "libtags",
            path: "./Frameworks/libtags.xcframework"
        )
    ]
)
