// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "GeometryKit",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "GeometryKit", targets: ["GeometryKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GeometryKit",
            dependencies: [],
            path: "Sources"
        )
    ]
)
