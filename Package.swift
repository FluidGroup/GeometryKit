// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "GeometryKit",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "GeometryKit", targets: ["GeometryKit"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "GeometryKit",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(name: "GeometryKitTests", dependencies: ["GeometryKit"])
  ]
)
