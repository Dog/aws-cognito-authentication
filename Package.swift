// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AWSCognitoAuthentication",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "AWSCognitoAuthenticationKit", targets: ["AWSCognitoAuthenticationKit"]),
        .library(name: "AWSCognitoAuthentication", targets: ["AWSCognitoAuthentication"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/swift-server/async-http-client.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/swift-aws/aws-sdk-swift.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.0.0-beta.3")),
        .package(url: "https://github.com/vapor/jwt-kit.git", .upToNextMajor(from: "4.0.0-beta.2.1")),
        // for SRP
        .package(url: "https://github.com/attaswift/BigInt.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(name: "AWSCognitoAuthentication", dependencies: ["AWSCognitoAuthenticationKit", "Vapor"]),
        .target(name: "AWSCognitoAuthenticationKit",
                dependencies: [
                    "AsyncHTTPClient",
                    "BigInt",
                    "CognitoIdentity",
                    "CognitoIdentityProvider",
                    "JWTKit",
                    "Crypto"
            ]
        ),
        .testTarget(name: "AWSCognitoAuthenticationKitTests", dependencies: ["AWSCognitoAuthenticationKit"]),
    ]
)
