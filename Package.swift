// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "objc-libphonenumber",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "libphonenumber",
            targets: ["libphonenumber"]
        )
    ],
    targets: [
        .target(
            name: "libphonenumber",
            path: "libphonenumber",
            exclude: [],
            sources: [
                "Sources"
            ],
            publicHeadersPath: "Public",
            cSettings: [
                .headerSearchPath("Internal")
            ],
            linkerSettings: [
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("z")
            ]
        )
    ]
)

