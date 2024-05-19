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
//            type: libType,
            targets: ["Bass"]
        ),
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Bass",
            dependencies: [
                .target(name: "CBass")
            ],
            path: "Sources/CBass"
        ),
        
        .target(
            name: "CBass",
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
        )
    ]
)
