// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "SourceKitten",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "sourcekitten",
            targets: [
                "sourcekitten"
            ]
        ),
        .library(
            name: "SourceKittenFramework",
            targets: [
                "SourceKittenFramework"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
        .package(url: "https://github.com/vmanot/CorePersistence.git", branch: "main"),
        .package(url: "https://github.com/preternatural-fork/Yams.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "sourcekitten",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SourceKittenFramework",
            ]
        ),
        .target(
            name: "Clang_C"
        ),
        .target(
            name: "SourceKit"
        ),
        .target(
            name: "SourceKittenFramework",
            dependencies: [
                "Clang_C",
                "CorePersistence",
                "SourceKit",
                "Yams",
            ]
        ),
        .testTarget(
            name: "SourceKittenFrameworkTests",
            dependencies: [
                "SourceKittenFramework"
            ],
            exclude: [
                "Fixtures",
            ]
        )
    ]
)
