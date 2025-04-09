// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Forky",
    platforms: [.iOS(.v17)],
    products: [],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.1")
    ]
) 