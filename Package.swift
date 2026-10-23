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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_absl.xcframework.zip",
      checksum: "b2d9c9bcc3bd9082582df96b3a3cb8e7166329accb811828658475b4f16f9ad3"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_AppCheckCore.xcframework.zip",
      checksum: "684c5fb78ba28b5d55e8a3e6837082598be14faae34784b1df5959743e94aaa4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FBLPromises.xcframework.zip",
      checksum: "c5c603e64a9380419dde2f1fe232101236ede109dfba8601f13f725219f116e4"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseABTesting.xcframework.zip",
      checksum: "5d085f62de0328980edf5aba8c8e0d227000fc28c3dffeaee16d9d679efdc8d2"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAILogic.xcframework.zip",
      checksum: "4fe3262badf2adb9f6b1bdb271cca4dca7086c577545c876f697f09c24f9c668"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAnalytics.xcframework.zip",
      checksum: "f5649d58f5d2f2a5933a528e94e504efb482f2a9e89e8d24e96191471d97f855"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheck.xcframework.zip",
      checksum: "9c1cccdecf999ce733b01c2d388d847e090021330286d1326333886c1adbedd0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0d0faf540a08f331d07ac4d848298cb14c63d3cb9b94f70284ad69b1a9719d3c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b3aca6592ec5c4320665671a3518619f12f259fa92cb018ade216605d5da1793"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuth.xcframework.zip",
      checksum: "4c53a65bd1aa0ae7868e7144b458bfdec712e674e1885d40f249f0f3a2eb162b"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuthInterop.xcframework.zip",
      checksum: "27be3d1642ca94a2b3420d87aab0f0dad027c7a60446ddf72982c0aedfc6a656"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCore.xcframework.zip",
      checksum: "46ef2ff0300e9e6ee39b2f6f5996191b4819e6f29c6ad35b70bd08291a14255a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreExtension.xcframework.zip",
      checksum: "8e3264b6bce1b485cb5c86f571976c5e2f3a946f022dc27f360590f3f6f703d5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreInternal.xcframework.zip",
      checksum: "89b1772b81629645bf84c9e93f2e71aa656120ae8844c9816e74a56f2582bc32"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCrashlytics.xcframework.zip",
      checksum: "72304c11d210590b127268a50792c34a3bbaca2e44c3e7725787c305f0a90379"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseDatabase.xcframework.zip",
      checksum: "a29d9f6e518e9ee0fb622f794b01ba290c98fdc1828fcbd214db1a63d945311e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestore.xcframework.zip",
      checksum: "2a134d49f131d6efc6cd73219bd807258b06e37d824e8a71a4db918f0ee7b8c7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "052a4ec5cdbd818ea0835fb129c7360fc6b84e377519c242ef32ec5e665748a0"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFunctions.xcframework.zip",
      checksum: "426250bb6247957913740c38f8a73bf18b505feeeb17e43e610e4c0b22aa5243"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c127fae61801743bab62b22ad3cc0bc6755f73d050178a7a4e3797f5f2063f88"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInstallations.xcframework.zip",
      checksum: "0def700c97cd024fb9593a1968ba8d9df46a00ee6f2150a9e8ab9e3924ecd12e"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessaging.xcframework.zip",
      checksum: "8158e7044329d15b47d2de366ec0d1d8fdfef5d93735d874c1598e27633d063a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5e9758971996a627fb566b04a6f26bee5d85bc58e64a3b976c53079af4b0981b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebasePerformance.xcframework.zip",
      checksum: "e85e56a691b888f139c080f98653898ad0264df1c27d34a66fcea221322681f2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7e311a88496845fb5ea7ccae5cd34aab03f19be02963aed74ddc1ea0b8cdcc50"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "de4c39b7ab27250cc2970bdc4b2850939f80369e1914b01c0d5b07ba04cf3126"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSessions.xcframework.zip",
      checksum: "cfec92feb7ec2d4220979e3d5501e3a27c54b0560caeb985f3927350e9567553"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSharedSwift.xcframework.zip",
      checksum: "04fa17f226d5fb41849fa171a1d2c7707c52e7965537a307625b88132759f2a1"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseStorage.xcframework.zip",
      checksum: "b50993005dd003d375444bc9988f63759e3f1a9c20f2c9391c543d2828211a52"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "942034a316495d767694bffe60fbbe745169165c3f33ee30d40b13de8906ed97"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6214ce7f8e5d3d3aa50a2a3fdc11a7261f18e9cbd47e868d789f651070ce5564"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d214d4f692ab10fe27ec176baab4b0a5c79a5c7c8452d3d67ed3fc0ebe9c7c20"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleDataTransport.xcframework.zip",
      checksum: "b8d5857f5aab97f97b197bb6de2d0f5aa949b6bc900fe86a103037fff19bfe24"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleUtilities.xcframework.zip",
      checksum: "afb033e9570333ed1a0bbcc7662e9ca96b75f5dcd188e2269f8f096d4475f984"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpc.xcframework.zip",
      checksum: "9bbe1745acac4fed36e99496c19496e9f6babedd33a150eeab1c584ed16ee1ff"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpcpp.xcframework.zip",
      checksum: "565de6f7bc3a48672249faf91e987c1915918198546381c5b9745c4b08b5cd40"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GTMSessionFetcher.xcframework.zip",
      checksum: "39159100df437482d578cc3f58749eee3e6ca7b6632278e5e9de3bc7a1c6456e"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_leveldb.xcframework.zip",
      checksum: "e677aeea48666801f113c43a4f57153ca67e5bc77e3ea88c3ce390f14f442796"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_nanopb.xcframework.zip",
      checksum: "784fc3eedfcb48d73588e535f4754d72477ff4d4acfa43641880206b2220922d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_openssl_grpc.xcframework.zip",
      checksum: "56a724d637f727a28e3946f2d87148c6a0ac5f4d4d21bf94390fcfb0bab4359d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_RecaptchaInterop.xcframework.zip",
      checksum: "591524281d43e7674eb69506b45faa5448a05aef5569297ed0a465d342eef51a"
    )
  ]
)
    