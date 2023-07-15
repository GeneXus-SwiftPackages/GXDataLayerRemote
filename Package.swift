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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.0.0-preview.20230715000002")
	],
	targets: [
		.target(name: "GXDataLayerRemoteWrapper",
				dependencies: [
					"GXDataLayerRemote",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.watchOS, .tvOS, .iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerRemote",
			url: "https://pkgs.genexus.dev/iOS/preview/GXDataLayerRemote-1.0.0-preview.20230715000002.xcframework.zip",
			checksum: "1909e8480fd15f64a9e4e864614c18851dd1187c6e7e707f61bb3349dcf5b649"
		)
	]
)