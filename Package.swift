// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBass",
    platforms: platforms,
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CBass",
//            type: libType,
            targets: ["Bass", "CBass"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Bass",
            dependencies: ["CBass"],
            path: "Sources/Swift"
        ),
        .target(
            name: "CBass",
            dependencies: [
                .target(name: "bass", condition: .when(platforms: [.iOS])),
                .target(name: "libbass", condition: .when(platforms: [.macOS]))
            ],
            path: "Sources/C"
        ),
        .binaryTarget(
            name: "bass",
            path: "./Frameworks/bass.xcframework"
        ),
        .binaryTarget(
            name: "libbass",
            path: "./Frameworks/libbass.xcframework"
        )
    ]
)

// MARK: -

fileprivate var platforms: [SupportedPlatform] = [.iOS(.v13), .macOS(.v12)]

// A known issue for using #if os() conditions in swift packages:
// https://github.com/apple/swift-package-manager/issues/4388
// https://forums.swift.org/t/adding-platform-specific-dependency-to-multi-platform-swift-package/49645/10

fileprivate var libType: Product.Library.LibraryType {
    #if os(iOS)
        return .static
    #elseif os(macOS)
        return .dynamic
    #endif
}

fileprivate var binaryTarget: Target {
    #if os(macOS)
        .binaryTarget(
            name: "bass",
            path: "./Frameworks/libbass.xcframework"
        )
    #elseif os(iOS)
        .binaryTarget(
            name: "bass",
            path: "./Frameworks/bass.xcframework"
        )
    #else
        fatalError("BASS; Unsupported platform")
    #endif
}
