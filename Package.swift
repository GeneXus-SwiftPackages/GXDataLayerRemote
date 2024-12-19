// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXDataLayerRemote",
	platforms: [.iOS("13.0"), .watchOS("9.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXDataLayerRemote",
			targets: ["GXDataLayerRemoteWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "2.2.0-beta.26")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerRemote-2.2.0-beta.26.xcframework.zip",
			checksum: "b371a114ef7a4171032f59e8e7d5ac0c732b22181a2ed0e0c79a101a0d37a4a9"
		)
	]
)