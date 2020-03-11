// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "DraftSport",
    products: [
        .library(
            name: "DraftSport",
            targets: ["DraftSport"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DraftSport",
            dependencies: []),
        .testTarget(
            name: "DraftSportTests",
            dependencies: ["DraftSport"]),
    ]
)
