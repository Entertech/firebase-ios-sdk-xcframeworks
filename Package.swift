// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_absl.xcframework.zip",
      checksum: "62d36473e286da1cde70145de024f5eb8df05e9500097ec845477d71dbce6828"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_AppCheckCore.xcframework.zip",
      checksum: "7ebe3ff04571773c5de5d7cd59a0cdeb8730d158cdaade008ebf130566f900d3"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FBLPromises.xcframework.zip",
      checksum: "66333f6c30ed8073eaf856896e314c46b118febeb9c2ffe80a7aa882ca9c46d9"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "285d0bc85f495f1e9c71af9da03e8428081a5da314ed1ec76ee66f453c138a3f"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAILogic.xcframework.zip",
      checksum: "c708e471d49ea87d63e068d88c6c6190854280c859d1f6fa26d8a5c82a85b917"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "cb18441f175aa00bf9a977cfa0cc97aea4a06573894d4cb9b16fe200bf36bfd1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "13028b8aece641a7414e98199f6a01f706b7d70c1f0af86a3b29455985310f87"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e3ef9f789942762d617dc54eb9d009ade27266b6b53d16446efe915c11294a85"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c59554082874bd122e11bf1726053c1113a608e928d4e5e79b337e75b5136fc3"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "239a54592da49d330287aa75bd3205319693d81aa7a34be1be96f2728dfd7047"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "eee0fa90996ab2e071947c569a85e41cab5d40c8d6a2b64a6aae186a060d8b73"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCore.xcframework.zip",
      checksum: "0bd0c37d4b52527a8797bf2d5bb38eae4568a8fc8b8c5e028caae6257511d6c4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "bc356a18e6615e91a0e75b164b3f7cf74d6ded1ab37a5d2e8926eb288567d8f5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c0180f26e4e75af31beb7dbd402c18f7f06b3bbf716f5025dafb9e04f6d72211"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "59a75de5192124e4a6532a3f30457f32c3a6a0dfc0b203f2e5a4fdf72a8f1792"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "9d6f31fee2d8853762d7accc8d409d85a9f9cdbc5f366d3d38d6aa8decee696d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b20be4d3e37672fcfe9dde169be05375505c896c2136575461da0f29e723848b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ffe8f62a37abbddd047bba6c0ced140fcfabc5c819d7834ff8b95d0f77a12010"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9c453fc3966b651a8737d9090b9106610865a089d50c73741c62f9733c5e5f79"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "582ee3c857c9462985de457bac44e39cdf15c03fbce64364c8576bc1fc23f2a4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1a71a9752e5b843bcd816a4bd113bc5d182d3082bfffd7e1de1810ca7bfab943"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "271b51b8572c3933f303b23c8a1c22f291acec5b169e9bccd406a07067608c1e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e7481deda8af21d29b244921919e2ddbf4f5791c13f38dc061be56a94869a468"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "5f65c4c5a4fff4f6aabd35a9d63ef7aad8dd09fabed4ae1d5ed83b7fc3897422"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c82fa516e1f2bca32908bb8d1ee02ace49467e5b1e34283983e23812a0b14706"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "658596206a8abb47bd784883b4cff1ef268b90f0a056071fab42812c7e099746"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "47c9d1c8b7ed88d44a8ac774ef568b81ce99b2916fec8d1a9b908c49b1ba6871"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4ff9caf62dc3ede0255c5c1539922e76d36ca2c8d6242e9608339dd3e31b9c8c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "0e3f13b54d61f35cfade8caa83492adc4a1e4e12efdef67cd6957b74c3c2b53b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "fd8b7fc1525bcf19c1894b844afdfe4dba236195fd2dd0417764d1ae088eb1e9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "c16def95465a22d85bbe386e412ad019a0b5be529ac6bc989021ce496b5595c4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "02d60e5059014d03543b6c800a513769d62814966ccc3ea93aa317be1e551004"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "85e2cf3bfd311e881eb8cd13a950fa1e84a3c5f2f560225ac6b19531af697bb6"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "f8265c281089ac28799703e7a4757d38633cccd1ee660085e7eded0870e17b77"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_grpc.xcframework.zip",
      checksum: "4213854422d47512c01012c66eb0132409f4519c58740bb3dbae1b97f29ff96c"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_grpcpp.xcframework.zip",
      checksum: "328bdf0ef85bcfa603be99a73faab6cb8acc490eb514e032283217a5967f4023"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "19a01341a0f5e8ed5210823a69cda7dac474c59f369111300df80d71a700f7e5"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_leveldb.xcframework.zip",
      checksum: "f4833b9837aeb940f3547164785b5bbe4844f7de130df2f6f188e5970560c9d7"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_nanopb.xcframework.zip",
      checksum: "9392b1f7c282ed39141a5ac675fa5221338977914c3bb8231e648daa4a3d6b9b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_openssl_grpc.xcframework.zip",
      checksum: "7f63515bb9a283f5dbf9ed41f90f6a4f2ba9e8371f47a5fe5d63480b7bdbf0e6"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a6fb7865cf5070d5eaed1d4402b8a64f2c0b046af44870d915eaca85599c58ad"
    )
  ]
)
    