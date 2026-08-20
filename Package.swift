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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_absl.xcframework.zip",
      checksum: "c385192564941a5cbcd3f5113be7dcc335abca13b853cd380e476a2eb1c9d43f"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppAuth.xcframework.zip",
      checksum: "a75d585458de7871c4e567a0c5210845e2b7d4194745938509a9f04270676b4e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppCheckCore.xcframework.zip",
      checksum: "4bcc3a2d817a5923eeef05fa913198f310e8c30adb018b8b5d41a9bb10ee37ae"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FBLPromises.xcframework.zip",
      checksum: "7e8477c22f4918bba2dd794986f1fe1a6f7200a65dd0c16339dc8840d52a7f53"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseABTesting.xcframework.zip",
      checksum: "4f3f7d12a123c9c38a935492708703508752047974b02ac71e3c6396160c4eda"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAILogic.xcframework.zip",
      checksum: "aedc929f671a977a98b22e952ea1742b10b861be8121bc60979cba8a708a647a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "49f7652e57b2387ce20558979c254281cab48d50ae982683f0fc08bf1e23a4d7"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "752b33bfb5280fac48a21c3f4af07c43455bce0a0a517d74a3aeaa40832a7c2e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d7135462cf70c3aff4de9c0b1bcdfe24bf0e7120d5a53e09696d692f16109873"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4656bb0dec18789cc4bb0004d68b403aff5a2ed01a24303724fdbe0d8d9873cb"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuth.xcframework.zip",
      checksum: "dda37e04baa68e58d460af28bf632ee809bdfa6eca3b4127d872fa0920161dfd"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "36164ebcfb728927cd9d266e07826fd094e9a97ab797accd77b1204443c2fd46"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCore.xcframework.zip",
      checksum: "3f748610d3b258d43af83839fdd7c598deccd792fe36cd0673fd2b558c2e924c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "3b838aebb048574ca6584fb7a8000b8f3fbb1fdec4a94d41f1d1c6fc17f7521d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "89de83680a79a51ec159c3530d9013f5888dc2cfabd6c13b6b6f3af57293080b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "03a2660bf5fdd4b3cfe634894a152747079b047239fd100e6cd3572f4560c88b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseDatabase.xcframework.zip",
      checksum: "497917c013c317306f46319798a34de1f874a71a00e254e5be114affe06b4704"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e70b31d55f3929477a1aec6694bb57edaf382cba585bfac503927c497597157d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "9828a914fd06309fcc1bc76596ef754db081f07490a36c7b55f3805651218f6e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFunctions.xcframework.zip",
      checksum: "eb94c6af221fe98c5e46f8029ddf63cd43e2611355d1a3ddb36bcc59d8400bf3"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "86b8cfc93cd68683a0a89fb1687e3b0d238a0111c3ae3936535683bb22653e66"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d510531a4ea933cca86b47ff7ac064fe3f095d4156f25800e97df9c4a5f297b8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessaging.xcframework.zip",
      checksum: "96edbf96cb6f4ce7ef25d899498f7145f1eb1a7167ccaf83f72c0486bd6e2e42"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b764a7f676d3c46c570cfc1cc725b25601af586d906d26944c3b2d316ac2d14f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "eb59342c4abfe2eb714ec6730000b7544b85685f312dd6816d31297b0100a645"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebasePerformance.xcframework.zip",
      checksum: "7cc808d60d498d4746bffdb7a23b5e17a087a57f4d4fd19ef45a4720e120c987"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "2fc23cd09f709a704c11f3f083ade15d0566afbd94a923521566a13b32c3c0e8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f020b38eeb95e4828cc79e66fff2b4ca0973d5211e960bdcdb18cd12a6c917c9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSessions.xcframework.zip",
      checksum: "a6368c7b750f2173c2b7275ed86cba661ecd5d41afa8ba8f5b0459f50facb1e6"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5f52ce8c05be5b99cda60c712212d13d3ac6783e23b047371afd09146b3676dc"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseStorage.xcframework.zip",
      checksum: "9416138e5eea087d806e1a8e9d7b63bb1f47e6f78514ddd4dc6ce5656d737b03"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f32b2f063de63e50cc4ed360a56c223d75bdd64b38309450c77b254d74370315"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "241273c43b702a5ea1e5269a7faa58ea76b4178a0ca8dc727b3caa9b49198488"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f5d3f12c6013d61b88abb7f027a070a7666b9dbe1acfbea6cbbf797e8b5b02eb"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ecccf9e83309ff5f1ba062693620d663beb28d7db5d3993a04b49a7129b43151"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleSignIn.xcframework.zip",
      checksum: "e52b3ee7ca77aa9eeb0145174701b187705e30e8c5ab5f43104da8f322811980"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleUtilities.xcframework.zip",
      checksum: "02779cf07d056bc1644140102c89937a895f827172a0415a612ed32857d40439"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpc.xcframework.zip",
      checksum: "6657d8a59d112245a981234b9a84f4f126426360830d9a47824eb1d5072d10fa"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpcpp.xcframework.zip",
      checksum: "700e568b3346a2af9360b2eee9275698245a436eb7baea9b2f857775616a3a64"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMAppAuth.xcframework.zip",
      checksum: "c014812f782a9cb3268a2494623e8d989d39f5edb88fae508ddf24c7eaf0ab44"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3d2d4d48f4f14b477e2b171968b8c2e05c93f875cb99119b349406b22640ed95"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_leveldb.xcframework.zip",
      checksum: "4ed31ba63082e79a6da1fe5a88351055dc2f099e124267ba2df05b6a83fba926"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_nanopb.xcframework.zip",
      checksum: "daf491f27b769cf6978f494d063f9ea268266c729d5b8ab6ae0d6f2bf6f051a2"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_openssl_grpc.xcframework.zip",
      checksum: "2693546e28f9667e657ebb44612762a70d9c0448b3458deaca36fc29e0c805ad"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_Promises.xcframework.zip",
      checksum: "865fadf52206a17b17aa2e1a998858f3bf96f49cce9f84ab663722bea871b143"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c5e4ede637a2b131b1f017ab5dcdf3408889fa8cd232e2c37958d2aabaa00698"
    )
  ]
)
    