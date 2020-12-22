// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StylePublishPlugin",
    products: [
        .library(
            name: "StylePublishPlugin",
            targets: ["StylePublishPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Publish", from: "0.5.0")
    ],
    targets: [
        .target(
            name: "StylePublishPlugin",
            dependencies: ["Publish"]),
        .testTarget(
            name: "StylePublishPluginTests",
            dependencies: ["StylePublishPlugin"]),
    ]
)
