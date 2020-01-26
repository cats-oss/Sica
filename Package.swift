// swift-tools-version:5.1

import PackageDescription
let package = Package(
    name: "Sica",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .tvOS(.v10)
    ],
    products: [
        .library(
            name: "Sica",
            targets: ["Sica"])
        ],
    targets: [
        .target(
            name: "Sica",
            dependencies: [],
            path: "Sica/Source")
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
