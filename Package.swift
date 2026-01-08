// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXDataLayerRemote",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXDataLayerRemote",
			targets: ["GXDataLayerRemoteWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "4.1.0-beta.19")
	],
	targets: [
		.target(name: "GXDataLayerRemoteWrapper",
				dependencies: [
					"GXDataLayerRemote",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXDataLayerRemote",
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerRemote-4.1.0-beta.19.xcframework.zip",
			checksum: "b07307a9166f1e3a68ece4dff0cba0c079536e759aa001bc466401b275e37b23"
		)
	]
)