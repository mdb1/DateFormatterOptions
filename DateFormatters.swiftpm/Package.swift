// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "DateFormatters",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "DateFormatters",
            targets: ["AppModule"],
            bundleIdentifier: "mdb1.DateFormatters",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .car),
            accentColor: .presetColor(.teal),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)