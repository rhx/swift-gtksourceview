// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "GtkSource",
    products: [
        .library(
            name: "GtkSource",
            targets: ["GtkSource"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rhx/gir2swift.git",     branch: "development"),
        .package(url: "https://github.com/rhx/SwiftGtk.git",      branch: "gtk4-monorepo-development"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .systemLibrary(
            name: "CGtkSource",
            pkgConfig: "gtksourceview-5"),
        .target(
            name: "GtkSource",
            dependencies: [
                "CGtkSource",
                .product(name: "Gtk", package: "SwiftGtk"),
            ],
            plugins: [
                .plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]),
        .testTarget(
            name: "GtkSourceTests",
            dependencies: ["GtkSource"]),
    ]
)
