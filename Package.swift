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
            name: "BassMIDI",
            targets: ["BassMIDI"]
        ),
        
        .library(
            name: "BassDSD",
            targets: ["BassDSD"]
        ),
        
        .library(
            name: "BassHLS",
            targets: ["BassHLS"]
        ),
        
        .library(
            name: "BassOpus",
            targets: ["BassOpus"]
        ),
        
        .library(
            name: "BassWebM",
            targets: ["BassWebM"]
        ),
        
        .library(
            name: "BassWV",
            targets: ["BassWV"]
        ),
    
        .library(
            name: "BassMix",
            targets: ["BassMix"]
        ),
        
        .library(
            name: "BassENC",
            targets: ["BassENC"]
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
                .target(name: "BassMIDI"),
                .target(name: "BassDSD"),
                .target(name: "BassHLS"),
                .target(name: "BassOpus"),
                .target(name: "BassWebM"),
                .target(name: "BassWV"),
                .target(name: "BassMix"),
                .target(name: "BassENC")
            ],
            path: "Sources/CBass"
        ),
        
        // MARK: - BASS
        .target(
            name: "Bass",
            dependencies: [
                .target(name: "bass", condition: .when(platforms: [.iOS])),
                .target(name: "libbass", condition: .when(platforms: [.macOS])),
                // Might be useful here
                .target(name: "BassMix"),
                .target(name: "BassENC")
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
        
        // MARK: - BASS DSD
        /**
         An extension enabling the playback of `DSD (Direct Stream Digital)` data in
         DSDIFF and DSF containers, and WavPack when used with the BASSWV add-on.
         Includes raw DSD and DSD-over-PCM output options.
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
        
        // MARK: - BASS HLS
        /**
         An extension enabling the playback of `HLS (HTTP Live Streaming)` streams.
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
                .target(name: "libbassenc", condition: .when(platforms: [.macOS]))
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
    ]
)
