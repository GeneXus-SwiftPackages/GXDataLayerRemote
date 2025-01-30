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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "3.0.0-rc.15")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXDataLayerRemote-3.0.0-rc.15.xcframework.zip",
			checksum: "aed9f53e0d4165be5abd979a90b7849081ba76a51237be2cdb7add3d03e799ce"
		)
	]
)