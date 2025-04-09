import SwiftUI

final class HomeCoordinator: Coordinator {
    public enum Path: Hashable {}
    
    var navigationPath = NavigationPath()
    
    func resetPath() {
        navigationPath = NavigationPath()
    }
}
