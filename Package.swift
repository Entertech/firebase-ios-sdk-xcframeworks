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
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_absl.xcframework.zip",
      checksum: "d8bf42fe4b5ff94b42ea8330d40e7efb1f93ffd61e67c803a2bf78784aa1371e"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppAuth.xcframework.zip",
      checksum: "9b863900c5848ee0b63c12056e16d894531881c42d61d4a6c6f3b611e39c1401"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppCheckCore.xcframework.zip",
      checksum: "f2034a89e259210cc3047478660b81e54e7cac576675280c09a5512364f059a4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FBLPromises.xcframework.zip",
      checksum: "16a3350b295b22b1e82f4eb61d616429ef208d89f89f36348048f18d57c272a6"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c543e5d4c228feab7efbbb61b231bc6ec7d12104f4dc1e7537ad00fdd4cec8a4"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAILogic.xcframework.zip",
      checksum: "bc5338d487aa9c4e0a9439534114e50b3f00eee863dc3807ffb4cd4ea4448436"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "87ae751c3f4d5b063acc063e3ae73fd4cdce14cffb81d732278b2eac71de300d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7512fd903fd9d60d0d5fcc93a489ae59e0322e2fce6c531867025d464ff5a780"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "71188e523227558a2b7f8aed892b68a0eb058f7db9835da8e924aca208e5be31"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4e558e446df3f7a9fe99eb4b486dc3b8607376691b87eb911eb0c2080a0989d4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "c5ccbd10a9f4289dcf121b8fa8d877f5394ed5dbfbd6fc15de155b8f8c2daf23"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "dcbb92f0ea7e9a8c77475ac404a915ae1658c8fffcdc2aa16a57a561ca8fb12d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCore.xcframework.zip",
      checksum: "e90fb0de2ef75f115648e10ecd2dd8730dfacc259319d1d5b06608ae9ef85685"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4fc464ea5d9a7739a6660bf946a3271fe625913bbe8b092e910dccc4ac19bdfe"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "dceae72b002e3cfc76d5d74e2bba3060705b50295ab46b7a082ccdf706f1a7ff"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "1f60678ee43e6edcfca6fcdb3daa2620828ad7d4db026a569e9dc11124c349c8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "7512336abf32d815807d29011c7889828b03ed28084d8819e62d3fa8666f5c11"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "556f9560cbd529cd0d11348a57db3702cd6f94273f25de41263e2e6372e6f465"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "3e4f93d51c08d0649e91d3f6bdcf179b1a1dceddeacccff550f9cc1912a48a62"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "cd94c496e30c6d5a901b0c7ef808eb7be966981a117d11e1c60e5a376bca8d8b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a41f689901698e9981d00ceafb253b39c29256688e5543ea88058a0ce2e1aa44"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "a666005cb11d4fb14dc5a6fa9bd0064ba5e8786444fc85c5394bc473cb5262a9"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "b1ad74933615b0fd2bbafca469ea633c1b50ac8b3d3104e5916079c8d27e8cc8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "54ffacac2ecb590c6a74f7c5498af4774d05e8609d6d4255698aeb9341ba6fbe"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "002e071a8f92a9d52e19ea1b4b26edf82153d9e8f1d0dc7888b4453eb4af295b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "53bae6c243038526149b323ae9fdea15881c0102a8c995647671a040e49cd701"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ffea3cf76e4882590bd7619982306636cd47af25e339700aedab57be8ba2ab14"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "fa30f85e3b2f3a083189e2114a24522257a652970cc251d71147ad44ea8982b7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "b20a63a258a4d9801039f945bde1c5b31c79f5ed87cb5e6e38ebe3f93bcd05f8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "bedebad3f1463ddb5a26f68d4bc2e48e557ff49d36be88a95c8697d1074bde25"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "1592941046ef4437924d5a3030ea95dba6e6829629e075f89d3dc7a36209e95b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "b4870c2e0a36127a8297342e6271c273909e86cfc05b8a4ba1534d0e643a5e7a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a00532250436ddc9da91db712bfba9e18e34f98a41aa1720be10decd9c597fe3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b9da3931115a400148fb33fb254cc975ac7a464ade48b8c62841b249e188bb8d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3405cfa124e05d96d652bb024966e102ab8101db864e72aa25021db96c94e0bb"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "932bbc92f0c4cd32b30c343912ff6915c2b07c6b5a1b0f630ac0b9d946b3ebdb"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "fa0d406dcdf3b7476aecc2b1666a49b32c1d1bcfe857060bc22fef72b4fc3f6d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpc.xcframework.zip",
      checksum: "e836704fddc4ff3190dbd83578bbf901c897f64f6a04e846ef9c75665214f56e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpcpp.xcframework.zip",
      checksum: "6a43766e40b9702fb965c10c3969f3ecfa47410825087d7e48681f2cdd4765e9"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "27f9459fda61ac5d9ef68fbb7764ba3495a65e0da8fd22d6a09ed096d12d6a3a"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "edba26c2e30f6015dc394996cc97a27c1fb029cf9072792502af4bdd642fa42b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_leveldb.xcframework.zip",
      checksum: "5f107be3e40108d36a86b742d930e55220f71d58da6bc48f8a937730f4d94166"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_nanopb.xcframework.zip",
      checksum: "b3ce75a68f087baf5c4d7ebd610fb69c548abce4508a34b0ed688363fcf67cbe"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_openssl_grpc.xcframework.zip",
      checksum: "8c81672ee1db13daaf63233a8b4c919e847e626e3ec7cd947c511bc394d9d24f"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_Promises.xcframework.zip",
      checksum: "110031b4ac48323a9bd213c3e4a87a0d4385756a99110c04110c936fe5d1ed92"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/Entertech/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "824351f65b99ad53432ee0020dc83860f43c97fd59872294f2cd7f7f8e445887"
    )
  ]
)
    