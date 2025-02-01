// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LipglossSwift",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "LipglossSwift",
            targets: ["LipglossSwift"]),
        .executable(
            name: "LipglossSwiftDemo", 
            targets: ["LipglossSwiftDemo"])
    ],
    dependencies: [],
    targets: [
        //library
        .systemLibrary(
            name: "CLipgloss",
            pkgConfig: "liblipgloss",
            providers: [
                .brew(["liblipgloss"])
            ]
        ),
        //wrapper
        .target(
            name: "LipglossSwift",
            dependencies: ["CLipgloss"],
            path: "Sources/LipglossSwift"
        ),
        //exec
        .executableTarget(
            name: "LipglossSwiftDemo",
            dependencies: ["LipglossSwift"]
        ),

        //test
        .testTarget(
            name: "LipglossSwiftTests",
            dependencies: ["LipglossSwift"]
        )
    ]
)
