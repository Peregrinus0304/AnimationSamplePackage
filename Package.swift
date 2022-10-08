// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnimationSamplePackage",
    // Package should only support iOS 11 and up.
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AnimationSamplePackage",
            targets: ["AnimationSamplePackage"]),
    ],
    dependencies: [
        // No dependencies for now.
        // For future:
        
        //  .package(url: /* package url */, from: "1.0.0"),
        //  .package(url: /* package url */, "2.0.0"..<"2.5.0"),
        //  .package(url: /* package url */, .exact("2.0.0")),
        //  .package(url: /* package url */, .upToNextMajor(from: "2.0.0")),
        //  .package(url: /* package url */, .upToNextMinor(from: "2.0.0"))
        // OR local path:
        //  .package(path: "/your/local/package/path")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AnimationSamplePackage",
            dependencies: []),
        .testTarget(
            name: "AnimationSamplePackageTests",
            dependencies: ["AnimationSamplePackage"]),
    ]
)
