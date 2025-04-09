import ProjectDescription

let project = Project(
    name: "Forky",
    targets: [
        .target(
            name: "Forky",
            destinations: .iOS,
            product: .app,
            bundleId: "com.krwd.forky",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Forky/Sources/**"],
            resources: ["Forky/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "ForkyTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.krwd.forkyTests",
            infoPlist: .default,
            sources: ["Forky/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Forky")]
        ),
    ]
)
