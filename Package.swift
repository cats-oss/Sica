// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "AbemaAnimator",
    products: [
        .library(
            name: "AbemaAnimator",
            targets: ["AbemaAnimator"])
        ],
    targets: [
        .target(
            name: "AbemaAnimator",
            dependencies: [],
            path: "AbemaAnimator/Source")
    ]
)
