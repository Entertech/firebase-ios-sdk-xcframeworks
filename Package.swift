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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_absl.xcframework.zip",
      checksum: "d0e14cd8e64813a1840ce9b0b513338d016778631fc6cf2e916218b9f2ae0d63"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppAuth.xcframework.zip",
      checksum: "0f258eb1f1df6374d4d02f95919d5f45a48748af19e48929e0d086ee21adf1ab"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppCheckCore.xcframework.zip",
      checksum: "40cf78ffb208b56e6def5b40a5d797111a8520cd01f1a543db35a8fad6b80bef"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FBLPromises.xcframework.zip",
      checksum: "3e72821278a7c7c0a00ed592341fb5baf208de97166a04695d00866cd60c733b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseABTesting.xcframework.zip",
      checksum: "d13f6030b5dcf5bc17947767f7987c544d084550b0dda797503e592bc13004ee"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAILogic.xcframework.zip",
      checksum: "926f577e2f9368008dfab1fe1a04ee3ff27ce294de84ccc5d41b7a85f9df2f4e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "90047e725761b44bbbf18bbd9bd5efccf718eb01921590db53bf68ae6853c70d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "4b9a5930f3237e9b6276e99f209f647a17a68824b1ad48f8fa102a8beed18a33"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "476f898976c6f76083521eb9a8070acf7cf1600bbfcd418206f72625e3eabad5"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3e3af3d8fd09780c4328042b2aaadcbdf494f1f6e22756b34e6995b94ea56851"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuth.xcframework.zip",
      checksum: "93e7aa5859497bc530b16c5dfa07be0963589454aa72b3ab18729293cf155ad7"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "1e46d9a0fbd03c5e9d90463a66a3517b6cb2917dbc3062bf8b51b135c1d67f97"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCore.xcframework.zip",
      checksum: "7dc3d97d23ec431a0b82197b76c61148ba7acfca4684383756f73c00f0d98f41"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "c52a20a838e3f4498ad495679861d13126a88ae365a63b36d706d344346de254"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4bb1681130b27615577447f31ae9b50b73a17a8f150b1f90e73d6151a14ec024"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c44f15810d22bf05072f12a4f6cc1e2f0c8b5e6bf0ad682416f17cbae4759e72"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseDatabase.xcframework.zip",
      checksum: "dbd22b755eb181ac25eb9fda086116acf7c59abdf2755082ad4423bdc8ba6f2f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a9ad4f248947120aa83af7a895bfeb396360a96cb173abf008d4b5ff99f816eb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "774c225a701e239cab5acf67bd85fd62bfc5650d459df7ac48c0644abdbf98f4"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0870a0f6b988c84bdccf32943fe3e37f02558f46bc997f953d923cf3b5793019"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6394caa05481a52708b8479abfc148854a2430e03e24fa15b559791a359c346e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInstallations.xcframework.zip",
      checksum: "260de5887a344cf77806908e91a2b17b84625c326ea4304e805afd8d5a05adb7"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4318aecca6000b935152c17ee684c062d0124261ad1d46d548c7dfa0ab3562e1"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "9b43bd3c73e157009edd1d6ffb6ac69a17da30fcc248335bbfb2ca757db29221"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b3e57fdf4def6d4b4da4719eb02326331b929b99c4df3eb675d640b34b62c726"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebasePerformance.xcframework.zip",
      checksum: "9ac4a8d1af88a51b767e21e062b257e9097e496ce174a983309137305f45c109"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "848469c0e867d4ce2892300d8deb36b6dac00689d17a67cc2072d8b993758f52"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "fbc76ddda9adff7a7bbe075b706811988827c36199609e8e26a69c7574f77e7c"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSessions.xcframework.zip",
      checksum: "e649ec2472cf8df10bc6a753ab13c245e50a538c1e8b6568435ed4869bc6fea5"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "36733d2ec47b9f4f39c5225841d63cdba91dd584a655e35c868c25c21ee00c52"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseStorage.xcframework.zip",
      checksum: "424b25aec3ed0e3137ec4741f741300fb9b14657623cc5f65c0622db7f91e596"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "31a5a1f5204f4844a480d3889b6ebe2e69473ef32b868935c51812c0483cb08b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "7ff29434e9b5741bfe775361a8a2875a6e972cc1098f9efde75e43d52d21c237"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "854d64ebb2d677eaa3a187d6ba156108b2353678abd15f40d9d58edde17a7bb5"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f00437a9fafff2b9872585318fde5a92bc70d67fe42b51758cfdf113e7730b91"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleSignIn.xcframework.zip",
      checksum: "9f99420fd4e40339c8955a78bd09fff155410da40f266a093fa4cd573efd4ba1"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleUtilities.xcframework.zip",
      checksum: "3bd7404b15a3fa912c53935f0434da44842d2f2f4abed317cad27fcef5cd7657"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpc.xcframework.zip",
      checksum: "8c5f51d00e3c3bb6bd411893da937a8525ddc8fc5cdb1a86533b62ad71b1b3b0"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpcpp.xcframework.zip",
      checksum: "5acd376738835dae060e6e2a26b807fc765066bc648eeb52c6848fe7c5e9dd6a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMAppAuth.xcframework.zip",
      checksum: "5689eba9d0cb6257076f8c94831bbce9e75ab7b9e2e6ac7b93f4cbf18e3f970c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ab30cbc0c78f2d22b1b5dc6e4c8086de6fdc0eebd421917f7d034df084ed9a86"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_leveldb.xcframework.zip",
      checksum: "69da9d51cbeb5d7cb030ce0fc73349b1284f5627222910307f790a0455223910"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_nanopb.xcframework.zip",
      checksum: "a256bf5cd21cc6e674cae9c435c787d4a15605169ccf7b6510b818a39e20983a"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_openssl_grpc.xcframework.zip",
      checksum: "f3d99dbeefa52775e8e1f97dad1767a51b3af2db9c7f1b074d6cc14f2dd0d0a1"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_Promises.xcframework.zip",
      checksum: "996f12101d2415ef69b855ff72a22f47ccc08f379fbfe58ceb8fa3df494e2afd"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_RecaptchaInterop.xcframework.zip",
      checksum: "332ac8031fccdfec7ae149b8d17731c5a85f1f25e44ee23f2d8aa317059c7e12"
    )
  ]
)
    