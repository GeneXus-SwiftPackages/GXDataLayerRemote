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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.0.0-beta.20230615110131")
	],
	targets: [
		.target(name: "GXDataLayerRemoteWrapper",
				dependencies: [
					"GXDataLayerRemote",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .tvOS, .watchOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerRemote",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerRemote-1.0.0-beta.20230615110131.xcframework.zip",
			checksum: "3cb071540fa43c1d73224f0f375038dbb47c395ed64f6e00a6d4ca0e5c050a78"
		)
	]
)