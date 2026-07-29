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
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
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
        "_Promises",
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
        "_Promises",
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
        "_GoogleDataTransport",
        "_Promises"
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
        "_GoogleDataTransport",
        "_Promises"
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
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_absl.xcframework.zip",
      checksum: "a5f0a8a05bfce7bf2d6377f035e574c6d0835584247ed5680a09c437c19f2139"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppAuth.xcframework.zip",
      checksum: "9665eced0a6fa6b733f84cd2226689a0a9d3375a928aac41545f04689af9d030"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppCheckCore.xcframework.zip",
      checksum: "95bce0090ea47e4b24021bd680d65e0eb051979f2056e3bc616b767d72a61de5"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FBLPromises.xcframework.zip",
      checksum: "2a3f5c8164eedd30ee08b858def9cda021f81c08b397b2e27be039c8ff8fba91"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseABTesting.xcframework.zip",
      checksum: "882e30ca1ed7adadceef434f6eb5a96c0ee55ff7e18d6a3f80e714e0cca3388d"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAILogic.xcframework.zip",
      checksum: "7ef3e4d256005ccc182b1e94a150b7f4071a7d787481c356e9fe117d40a7bdfc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3cb7170d5250f6d4c9ed070071e55d05a32cf31a32de5aa8b52b56c774234bb3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "eb378d405c9407429c1655941592964f7c65b1cd57b132b9bf6021da9dae50e7"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "c33263c9b52eb48b5215d9eeae4b14effff89cd453268eadbf3bbd50798cc175"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b2bcff6fd0b50b496fca162857f3a596e76ec1627aa9dc157b72157a60707dc6"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuth.xcframework.zip",
      checksum: "fc0d21a111ac524eb2f4e9e65462d5704c97ce73ea8ecdb10e214a6b73bfabdf"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "571b78c0e49fe2e0ab1d9233773dff4bf55e3027a1cefce5d7dbf55db74d4f81"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCore.xcframework.zip",
      checksum: "2a22ee8db3285a6631bcc656edcb0cb378213fc0fb0ce16f26095ec368df8bb8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "bc055731575c0155f434bf16c134e0a09ae1ffd44b00405434412ec0b0500ef8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "1d5958eb1b27be52126559e8480b42bf12ecd1f9514a89d517cf5bab675876fa"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e85fd56bfd022a4720784ece74219b8f33234835e4b5ea84d58e394fbd538244"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseDatabase.xcframework.zip",
      checksum: "bfe6508b15b4193220edf712242dc82a97473ab8086a8ffcaff3e78322bf7574"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6a1d2c787a000220c4d61b5fbd307f94a1e946b1dc393f375e4662ec02ed4192"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "82d27d68554b2c1b69d3104b24b64904a6c56fc79c6285bdb473d2c99287da01"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFunctions.xcframework.zip",
      checksum: "6a22f5b65a6b5ca7ebb2219c7c5868f155173036089bbbdd7ec3d4120bb28ba6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1e8550f3c3159202472e3454eb548f08822ca8fb4c031aeb1ee1b962c94c9d75"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInstallations.xcframework.zip",
      checksum: "991006438f0bcb42438ac7dd31f996079de8381483ab6db246cc0d76b1de75a0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessaging.xcframework.zip",
      checksum: "130ddcd643fb3eb03319d55a1eb4fe77bd5345154fdc6c68e74695eab6532fdf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "caa2cda30f102e534808516e06b6544f53fd9f819756844bf9c4f20a34d1efa1"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3cd10aa86192a7aff629a91cd7b50e73a9aaed3f13546f732b1a0b93f5550211"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebasePerformance.xcframework.zip",
      checksum: "b9bac686918b8c6ddd7931ccf7aa2c40e8e21127264546b470deb5de99dfe295"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4a018c693ca9e684b8b791a45c3d3d92157442d3496313bc76067698e8dc2fb9"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "405d48972c092bfddc372b1d8f6621a90a8fab6046458bf5716be1a1e204d471"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSessions.xcframework.zip",
      checksum: "60cc20acdc17a7a29d3a9b3a7faed1c4f6b814eb96839b282e629bcb60b4021b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "7a3bddc73e7da3eda8c5019623b5e403178dcedb505d013648254815ff8805e6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseStorage.xcframework.zip",
      checksum: "1391514320a4487c6b753320d8d9305d591dde38b78f4d9d428b4553737d8ea8"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0f088b8a085e62a38b016e33f04d000511deb0e6a0b15ada507cd73512593582"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b14ae560b6d4acfe0805381a9ed0c8b38a3bf8cbf0803716bc9ab7ce30992008"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "06901efefb17a694cf0550cb7e6feca329cea6d9771528626f5cbcee3d31e14e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleDataTransport.xcframework.zip",
      checksum: "efd60eb41e72030dd71ff99a00213689c40cb499c3fec061d7f9153edb8091a2"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleSignIn.xcframework.zip",
      checksum: "090069cbf3923d2be4d17ba9ffd9f8560a5be97fb01a0a4f7903151b5d09d1b5"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleUtilities.xcframework.zip",
      checksum: "9a44a98be8aa7c5d7ea23c8389598c8ac3dbbbdf39bbaed75451dffeaa8d3663"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpc.xcframework.zip",
      checksum: "b668085b4f8b08f16db9829c82bde08c047ba016fe9ca6c5be257ea162abbfff"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpcpp.xcframework.zip",
      checksum: "1a7c42134f5da7e5090cdfcd8062fdc583018c15a0e4ff86c220b87ae414ff15"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMAppAuth.xcframework.zip",
      checksum: "27c0ee9b2de8783249f2b7bfda4be42206fba3b3980457795ef485f7e8e6a19b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d366fd20eac50e8a5638e787c6794fef2cf44ed7eea428d52c97038361d7f961"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_leveldb.xcframework.zip",
      checksum: "452dde6dca07fd7a72fdcea7832fdcc10c2f8e5b1db2ef9225ecf044ed48a17d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_nanopb.xcframework.zip",
      checksum: "37ce125234e9be4a2be904787ce224286fca2255443493e9acef31f1f56131af"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_openssl_grpc.xcframework.zip",
      checksum: "a12c046b31c6d4272560fedf8e3069e61710b419c0638dcdd10c4e6406fcf926"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_Promises.xcframework.zip",
      checksum: "ee663803b08165ddb0a9f4f038ba280f319206bcb3a62138aa083bfee5625c2b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_RecaptchaInterop.xcframework.zip",
      checksum: "db9597b88b02e7f5823dfcc6f74c3c692ab4406708b67eb0e30556fb4065f5bb"
    )
  ]
)
    