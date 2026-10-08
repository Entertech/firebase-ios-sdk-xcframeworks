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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_absl.xcframework.zip",
      checksum: "98268b2048cde0573e6448b36d5c09a65e64c1c12f671fc34ee786a6f9a93936"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_AppCheckCore.xcframework.zip",
      checksum: "12364e72036fbc98893df1f9376463474a34a720fadc8c2dc690740d58f8c8ea"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FBLPromises.xcframework.zip",
      checksum: "1a886fe8ac5aea0757a71d22b60c4d0446fffedbf18c9808dff7f37120d011ed"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseABTesting.xcframework.zip",
      checksum: "84edd45914dd37183ae061e7052aae6a9259d597a711ca3337a4015c466a7183"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAILogic.xcframework.zip",
      checksum: "e5f187269015b6cdf1c060fbf9920d782e7731b60844d5bb7a28fbed6cf4960e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "2dc2e378d5752305625ec50890ac1fa3cfd9bde6ac0af3cde70c1d444e3fa04b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "6ab5b1dfca72e25f19e6ceea2aea1f6901c5b91dd6fbce09ada300508d256dd6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7233ebcb538159e457f36ebbc344692f0d81530fcd5f61d95d4dcee91b4ddf81"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a223241406819fdd49b8700289970b4fd285d63256c9f18fe8baedc90b50f72a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuth.xcframework.zip",
      checksum: "573763da62469f7a030b6fdf43f59881ed7536c5eaf757977025aeaecc6209ee"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "15e3f6e062be787813055d9183b5fb19b965e985606f532105864b4564895113"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCore.xcframework.zip",
      checksum: "9d1d4acb2cf8c5acfc1cfb82bc3fc4cd0fd3c7238d4bb11603865e885eb64205"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "1dd734dff467ce3f5e517a816ab8d104431dcf0fce1fc32ddf0f7a1bb951704b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d832668078c3884a31806429e112d351d8fbc228195fe6f135899fbc48d3be1a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "71d5d2585b0ef27d39c268cb24fa5d3aa9f39c15be7dcf4f6b6a6f184dc1ed46"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseDatabase.xcframework.zip",
      checksum: "b3e1691eb81a386bbe427d461f7cad4266a90261e0c236d3701da021a103f600"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestore.xcframework.zip",
      checksum: "944c664cca874b91d688665b3a9a3fa4fefbe401ee0db4080a0519c973725f37"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "1385400fcdbac83e42d95c98fbef680a76fac741c5ee682ec1d7fefe48e5b40a"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFunctions.xcframework.zip",
      checksum: "ccf0f24e51d16d1c29e8f1a17467068b1ce02acc1b4ad0b8d709bc65a4fb84ff"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "105e0b925113eb412c31291b4a9ffbdea53e56a7528bd20a7c0491b5413f995f"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInstallations.xcframework.zip",
      checksum: "dcfc54381409e22c73756325ac311bd88f27d5e8b797c67512a7791e04d659ea"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessaging.xcframework.zip",
      checksum: "9cea3dae521fd1846201d179a391fddf876e8ded63b20760dea69a4ade651ed8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "dbe45438538a42aeef967f71eb9b7abb534d606da75864df0bdd1b0f3774a8e4"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebasePerformance.xcframework.zip",
      checksum: "02574dc5a2c5d91609f406e2d714a15fe3eb001fafd0ec11d5b4682e3b847a6d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ea67e01aecb62a0692fc0b15bbc88086d57eeebc564cc089838000a7e2e8491f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "44683d8b0ede0e1ec2a6dd49ec81159d9ea22d4ad172b12ab59ce6f8c29f9772"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSessions.xcframework.zip",
      checksum: "a2a904b6433179391a9c3f5df40d798e3740235a58641e2851dad4da76843726"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9576579923d1cd6b81fa51a17f322e70b531b5f0e8d124588491b9521f0e28f8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseStorage.xcframework.zip",
      checksum: "cddf0c6a630f404d887a890eff3c32bbf60a0b2755234518574292d70e74cb4f"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "70f013777ffcb9591b0d66a4cefddf6c9682717374cb504beb39a62b3ecc986e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5a8aba97ffe3f953364fab70e934c8e0b2d5febd4a9715af0c8ce250e8c4d74f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "79703e685cced4a39b8083e90e71ebccfa3125956eab914597056f4d7f579017"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleDataTransport.xcframework.zip",
      checksum: "5d0f059a5661027d95cf09695c12dabaf849efd926057d775bdeba36a99b34f3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleUtilities.xcframework.zip",
      checksum: "aa36721b856ab74d2e93c52fdc5a7286ab1a2017879711df3d2b4ce5e889d029"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpc.xcframework.zip",
      checksum: "cd15c810f85037d4adea4bb403930b9507f519fc66e6dec3075dacfe8faff672"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpcpp.xcframework.zip",
      checksum: "738e8276290f8a51b357f2186bec0c11c65faf1079ea7670899ed34e407fa073"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "9e84ec37eae66343bbb1a7ccf1e077a042649452191d3ef5535f9f46e5c6f85f"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_leveldb.xcframework.zip",
      checksum: "d854f6cbcc7f139c64612b7219095decb61c22851c83914f09b6bb66c87b49ff"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_nanopb.xcframework.zip",
      checksum: "e8b189a032cd08f1f3ff322684179dc4c65ced7d0d4b14a926fbe37ca628b15b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_openssl_grpc.xcframework.zip",
      checksum: "7edac4149921032a9068098fe9d3b480cb5bac51ada68e74ecd794a05e426cdf"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_RecaptchaInterop.xcframework.zip",
      checksum: "efac8b4813aee76f46d30f884067e312bfbd29bf8a380980e9904ea21e01a7d9"
    )
  ]
)
    