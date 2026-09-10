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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_absl.xcframework.zip",
      checksum: "e19306588a5b22e4baae59bf3d34ac35a20572c56bb3ee98926787f2298b092c"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppAuth.xcframework.zip",
      checksum: "ea0a9e22e7d289289ce39097f92530c249203bc4b0ed72918c5f0227281e1b1f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppCheckCore.xcframework.zip",
      checksum: "4edcd7249d66998aed0fe6f9e2c63f4729b0a19b136aac217a1b8d774134d7df"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FBLPromises.xcframework.zip",
      checksum: "c23b30ac246c644137c306d179382091cbf49c02cd9226265ef7677c540413a7"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseABTesting.xcframework.zip",
      checksum: "32cf0fdcd7b5fc54e71598aeb9b6cea8488933ee4f78a8e6bc19ec4a2745b03a"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAILogic.xcframework.zip",
      checksum: "d33cd4cf70c2c427353566bc6dc548b4c0e8783860f3c85367eed7eadfe5af74"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "4b69a53ba3c2d63a57cc1cda400f1abe0ad82e095c2e0611c91c106bdc94e038"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "5d77fb7ca1dad14775f7310310c18e00d5bc590c6f8a16b5c91d348a82d7008b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "27a74c51a2d69fd7d410fd4523b3846d4ef5603ecfdd323e33abc226dbdc8344"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d16d76e8cc12249a867d8d5816ae7ea0beffdacbff30908da215db455d99b599"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuth.xcframework.zip",
      checksum: "9060546befcea81d21593ba45882fb037881143510052d18f1618f01e59b48b0"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "aaa14fe0aef995f2bc65d1a5eaa3ee3280aa2b5ca5d0a0cef3f79103a7b5eb2e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCore.xcframework.zip",
      checksum: "19392d201bb4b5f02413f554db29eb1064316612565aab17b2a8de1da26d2aba"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "aab47953e3e21fbe9cc16291cc4018c5518ec692a8198b5d1356f0c2bd7bf41c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "775f6a8c507f2218e1370f997e81bda1c34ec73cad00b984a74935bfcb2bb36b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "34b4be402e0bd081814b77d99d06a3933cbc6746f4eb49a8f9c28978dc45c092"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseDatabase.xcframework.zip",
      checksum: "5e115aa6b3b4eef433a7888d45c3b7c105aacd98530af98a40b6b155ee810de9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestore.xcframework.zip",
      checksum: "1374ba091549b69192b230932aa0eca2f60be17e46d1ef0b4ceadbb158c14375"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "1d70b3e86cfaa8c0f693e75c2b03018e48b052e98c2d8d1e9f53096ed6ac65bf"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFunctions.xcframework.zip",
      checksum: "4f2ffea8177cacecea50c33e6489af0515ef617b6c15dfadbcb18a4dc52860a7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a2b1f9bfab1f45ed081fba80ea959d0101746c64ccbda8762e1b73f3b6da9437"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInstallations.xcframework.zip",
      checksum: "465f78351fc4a35bda23c22f5eb3403875528284a08176f6f48944b9ef6d4371"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessaging.xcframework.zip",
      checksum: "a35123017fec90a783c901329de777b11e9f3d8c814a390282132006b2a45c15"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "2082e297e857dd454e985c6cab3521a18558efe64b2e6604937484100c68f2e3"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "25efa1b08bf258a8b979f5bb1074f791a381550eb9b5c5e5e531acd1239da95d"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebasePerformance.xcframework.zip",
      checksum: "44d7be34f494d15bc4e5cca491b57c5fe1a916f27e32e197633d65079c112ba0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "0c9964b71dcc0926071b051be1a653a9468ef4c7fa75f4a788bbf8c6b164b88d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "475b7e078aa872295ce45d7f0951b4c965a6e31880a3d83667fa8aed3f253db4"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSessions.xcframework.zip",
      checksum: "818a2bd014598d251d09ae5ee95dcca6d4408941f8dca74da5db7cbabfd82223"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "1822b8abb27cc976e3362e90aa7803893442331d3a98ccfc6903633788c2cd95"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseStorage.xcframework.zip",
      checksum: "402a4128c4792883863ccb1fe8822c263767ed06145838299b33f1a93d61e4dc"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "53f5409b716b436cf0b3e01ac09d92160fe853a06786ab7aeb6f97906095492e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "2339d54ba5503ece0bfc9ed6cfd25a9fb500a7626a0d14d2ea6b35a9f3be8cfc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "cd698b9ee92fc5364bc074b6e871e628a1779a3adfd83258e48d994b44f4dce9"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleDataTransport.xcframework.zip",
      checksum: "38a9109c228ac50048de701bce13cc00e50e1d690253e930abfa4e704bcd1ecd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleSignIn.xcframework.zip",
      checksum: "759fea50930f7063896ed717a473bca5599539f7bb1a5fbac01da5bb0fcdf50a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleUtilities.xcframework.zip",
      checksum: "167acf0b31d1500e2c322900a237f1fc60c0d3677faa51016bd1507b0b466b14"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpc.xcframework.zip",
      checksum: "a6aaef3dbc956250f7673026567a979fb500619535c59d3fc5e33daf1f04366f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpcpp.xcframework.zip",
      checksum: "51147f39f9a1f6d7699b0e1fb2af06a66b41c5fb3e0f37539d142fb6813d51c5"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMAppAuth.xcframework.zip",
      checksum: "92e987c1dc0a0e1e95d8e08c1cd1a21bd57921468acc5c0eb2042b384e545e67"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "ba6c17cf83e532fdee201ecc508a299b85e2d810f6a04a7ac71ccb220650bee2"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_leveldb.xcframework.zip",
      checksum: "667d52d4bd22070d13be00af422216edeedbd9cbe8256ae1d62506af5eb662cc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_nanopb.xcframework.zip",
      checksum: "ca165e0c46477d59a2380f3908e621f5ad47f38569e0d2729e51505e6fb710b8"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_openssl_grpc.xcframework.zip",
      checksum: "188b17a00308b0901ad83716fb82c24802d947e7a76c5b40baf3cd89756126ba"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_Promises.xcframework.zip",
      checksum: "a6dff18a67d81ed9624a24171eefa259fa60de610d0bdd2ed049575f928240dc"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_RecaptchaInterop.xcframework.zip",
      checksum: "71ee9bede982949da1e398eb4d028b0c0b306db3ed5b3f44fd8904f6037da6b2"
    )
  ]
)
    