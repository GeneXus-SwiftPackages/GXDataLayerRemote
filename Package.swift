// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXDataLayerRemote",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXDataLayerRemote",
			targets: ["GXDataLayerRemoteWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.2.0-rc.1")
	],
	targets: [
		.target(name: "GXDataLayerRemoteWrapper",
				dependencies: [
					"GXDataLayerRemote",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.tvOS, .watchOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerRemote",
			url: "https://pkgs.genexus.dev/iOS/preview/GXDataLayerRemote-1.2.0-rc.1.xcframework.zip",
			checksum: "e0207465b051fcf1da9d77e1bd4353bee13cc92da5f40ebf43177e86f6458ba5"
		)
	]
)