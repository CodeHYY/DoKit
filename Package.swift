// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DoraemonKit",
    defaultLocalization: "en",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DoraemonKit",
            targets: ["DoraemonKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DoraemonKit",
            path: "iOS/DoraemonKit",
            exclude: ["Framework/", "Src/Core/Plugin/Platform/FileSync/"],
            sources: ["Src/Core"],
            publicHeadersPath: "Src/Core/include",
            cSettings: [
              .headerSearchPath("../"),
              .headerSearchPath("Manager"),
              .headerSearchPath("Base")

            ]
        )
    ]
)
