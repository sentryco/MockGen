// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MockGen",
    platforms: [
        .macOS(.v14), // macOS 14 and later
        .iOS(.v17), // iOS 17 and later
    ],
    products: [
        .library(
            name: "MockGen",
            targets: ["MockGen"]),
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/JSONSugar.git", branch: "master"),
        .package(url: "https://github.com/sentryco/Logger.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "MockGen",
            dependencies: ["JSONSugar", "Logger"],
            resources: [.process("Resources")] // Include the "Resources" directory as a resource
        ),
        .testTarget(
            name: "MockGenTests",
            dependencies: ["MockGen"]),
    ]
)