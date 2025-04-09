import SwiftUI
import ForkyPresentation

@main
struct ForkyApp: App {
    @StateObject private var container = AppAssembly.makeDIContainer()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(container)
        }
    }
}
