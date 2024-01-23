// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "GtkSourceView",
    products: [
        .library(
            name: "GtkSourceView",
            targets: ["GtkSourceView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rhx/gir2swift.git",     branch: "development"),
        .package(url: "https://github.com/rhx/SwiftGtk.git",      branch: "gtk4-monorepo-development"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .systemLibrary(
            name: "CGtkSourceView",
            pkgConfig: "gtksourceview-5"),
        .target(
            name: "GtkSourceView",
            dependencies: [
                "CGtkSourceView",
                .product(name: "Gtk", package: "SwiftGtk"),
            ]),
        .testTarget(
            name: "GtkSourceViewTests",
            dependencies: ["GtkSourceView"]),
    ]
)
