// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "Shika",
    products: [
        .library(
            name: "Shika",
            targets: ["Shika"])
        ],
    targets: [
        .target(
            name: "Shika",
            dependencies: [],
            path: "Shika/Source")
    ]
)
