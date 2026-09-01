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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "5.0.0-beta.5")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXDataLayerRemote-5.0.0-beta.5.xcframework.zip",
			checksum: "5cfa23f186fc0a01e5cc904609c1b1440465b9f1a6b69e3005df0931bdd82d33"
		)
	]
)