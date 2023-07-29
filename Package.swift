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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.1.0-rc.1")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXDataLayerRemote-1.1.0-rc.1.xcframework.zip",
			checksum: "668d1f485a7f9ecbe131eaab226c11b1b890492bcd82f39008f4c04d8ecec26f"
		)
	]
)