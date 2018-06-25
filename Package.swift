// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "Sica",
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
    ]
)
