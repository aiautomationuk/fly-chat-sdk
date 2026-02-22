// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to
// build this package.

import PackageDescription

let package = Package(
  name: "FlyChatSDK",
  platforms: [
    .iOS(.v9), .macOS(.v10_13), .watchOS(.v4), .tvOS(.v9)
  ],
  products: [
    .library(
      name: "FlyChatSDK",
      type: .static,
      targets: ["FlyChatSDK"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.7.0"),
    .package(url: "https://github.com/aiautomationuk/fly-chat-foundation.git", from: "1.0.0"),
    .package(url: "https://github.com/aiautomationuk/fly-chat-compression.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "CFlyChatSDK"),
    .target(
      name: "FlyChatSDK",
      dependencies: [
        "CFlyChatSDK",
        "SwiftProtobuf",
        "FlyChatFoundation",
        "FlyChatCompression"
    ]),
    .testTarget(
      name: "FlyChatSDKTests",
      dependencies: ["FlyChatSDK"]),
  ],
  swiftLanguageVersions: [.v5]
)
