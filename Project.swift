import ProjectDescription

let project = Project(
    name: "Forky",
    packages: [
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.8.1"))
    ],
    targets: [
        // MARK: - App
        .target(
            name: "ForkyApp",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "com.krwd.forky",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Forky/Sources/App/**"],
            resources: ["Forky/Resources/**"],
            dependencies: [
                .target(name: "ForkyPresentation"),
                .target(name: "ForkyDomain"),
                .target(name: "ForkyData"),
                .target(name: "ForkyCore")
            ]
        ),
        
        // MARK: - Presentation Layer
        .target(
            name: "ForkyPresentation",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "com.krwd.forky.presentation",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Forky/Sources/Presentation/**"],
            dependencies: [
                .target(name: "ForkyDomain"),
                .target(name: "ForkyCore")
            ]
        ),
        
        // MARK: - Domain Layer
        .target(
            name: "ForkyDomain",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "com.krwd.forky.domain",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Forky/Sources/Domain/**"],
            dependencies: [
                .target(name: "ForkyCore")
            ]
        ),
        
        // MARK: - Data Layer
        .target(
            name: "ForkyData",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "com.krwd.forky.data",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Forky/Sources/Data/**"],
            dependencies: [
                .target(name: "ForkyDomain"),
                .target(name: "ForkyCore"),
                .package(product: "Alamofire")
            ]
        ),
        
        // MARK: - Core Layer
        .target(
            name: "ForkyCore",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "com.krwd.forky.core",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Forky/Sources/Core/**"],
            dependencies: []
        ),
        
        // MARK: - Tests
        .target(
            name: "ForkyTests",
            destinations: [.iPhone, .iPad],
            product: .unitTests,
            bundleId: "com.krwd.forkyTests",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Forky/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "ForkyApp"),
                .target(name: "ForkyPresentation"),
                .target(name: "ForkyDomain"),
                .target(name: "ForkyData"),
                .target(name: "ForkyCore")
            ]
        )
    ]
)
