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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_absl.xcframework.zip",
      checksum: "dc43633996999517aec0336c6092f5cac0dd7067790bb2086e9569f7d3d29318"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_AppCheckCore.xcframework.zip",
      checksum: "a7fd1eae010a46cec5ef3fc6aaec8bdf18d90c5b62ecd344cdcd18f2c7b03d16"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FBLPromises.xcframework.zip",
      checksum: "f6cc5214dd5572eae5e0bd5620ecbd45fc23c3d8199164c038cb6527d7b0ccdb"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a910bb691bb24ceb79c38113d28b08e4a4aa48e4dab03d4a2d6daade0eee322c"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAILogic.xcframework.zip",
      checksum: "fa61a116277f8cca2204203cae00f4e2292095a78a0c119e2e9461c781bcd678"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "96b9133ccf65d88a536357c86135943df374fb6ca237898a64caa086b29a8f84"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7c8dc420edef5e85bade159477569cbc17ff6d4909cb13a69a96a3e9c9d37889"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ee032bdbafb1e6998ca21d8d45e76ed2e32f711bc22d8faf6c4bcafb3ff07a19"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "70a4d413b8fa07ae5318f77e7269f485e3ff312b8eba8e85d03e0dda5671ffa9"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "2f8fe747b93b8c172f36443402602f7f37ff6d83286cd730adc8d7c6bf2820ab"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "848e89adbaef5bdc0ce068d980061b52bdfc3fd5abe56c4e805a10aa4dfb7a15"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCore.xcframework.zip",
      checksum: "b725e2542d688f00bb026b48bf6d9fe6bc592be176fe3289a897ba3f639dc038"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a4c535a5f299f0c964b02fbe032fa42cc4dcbd593caddccf104e8538920911cc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "fc1c7e51e55e5d132bc4681ad86b3a6b791d9e46fd9498811f6d986bf6b4ec5d"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3868d114e58f906c47cb86ec398061498d2570de6a73b96e0d27c95a58a5906a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d6d1503cdb55d228bdb94c1a7521621352ced4d2df770a3933c89389139e9951"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2d6f56924b80a0517ba1cdd79fcdc111b95522c2a96de8453f3ebe4041d97613"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e291819c02eb3a92a99e9de9fb7b6377c0b75c3e82096a6b0597ddef055696ae"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "3c67cc562dbf4209346465138cc61200ef89c0a352ce58c6aead78e983234dbe"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "28edd1073d85d8ea1c579b9f43a526a505840724fedb84e03e960d8c54714be9"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ba27aabd776ca911fd0532b7ab0eb57934ead5a130ecb5deb1a951c9ff4554e0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "cf831c03ab9619f2b88bac4e3f5d9fa053514874a6478935abb5a83d925f903c"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "250ec19f80a5c5286f987ab79b7c777f2f20c2f8380fa1808ba202270d2393c3"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "8fb90bfa0367b60566b995fe22d6f3186f922856fccb6d0d484579ee6389e865"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e7c5f17959179af3bc55dd429b8d5ddccef28349f0407b2f44bbb23f2c8f143c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1211425cee2fd4413a8359ad43b6995a08c911397f7a9107b5981d25acf1cf4b"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "a7de5e241ee15ea57f4ed891c3c8d1659128c1e6d37cc252fbd0414140a1ef00"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d56abd52c43e417d099a4881f29dd5033a5c1a627723e3184acaf5880123ffef"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "210371ec9f90abf1a8e9efac8b0ef1150c733bace0f4ec8c38d4b4cdc2d3d53f"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "bff8551b24f0a0f691b14d7233113bbbf601cb9f8932d437735a063e1c14d813"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f8af805bcef8f7752c208f44b247638d142a1f86affe822cc0e2ed2c44addae3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e565cc3ec2d06d8d538be062aae95024363dbb4a59d2dfda553d9d19e2200d8e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d0da43bb08e5d1f2cb65c49b20f64e5695fb07bb2480812ec4ee075529079d0b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "0f427f5d5dbc156bac615268a58a4cd2d841ac78a31e54a0bc7393b81a2c8040"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpc.xcframework.zip",
      checksum: "76648a037cdbaec844e5f69b1e0475eb6f7ae3a8d65c2c4cb1641f017d355e70"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpcpp.xcframework.zip",
      checksum: "b8c87af5eb699b0279978f30e194c27cf2eb7811ce3765271558999c6e64f15a"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "95df13391287dcc2194563ee85accec54786d5aa3cd8d2ca852f01a2f273021b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_leveldb.xcframework.zip",
      checksum: "33d9cc90aa43b71f075941bafa1c5c1f33dd0a607fae441de41348d39784934a"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_nanopb.xcframework.zip",
      checksum: "22cd67635db3d1443d6d043921e602967c7fab33d4d0e60540b2400ca8c9e732"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_openssl_grpc.xcframework.zip",
      checksum: "9d8d3f57d5fea13623d88e008c4a6b5d26ab7b6cd9a5680cc0e4467f8d32cb87"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d17fbe44fb613dbc14060d2feb9fc0613d2bbe86e5b2e8dec927c44cf64929c3"
    )
  ]
)
    