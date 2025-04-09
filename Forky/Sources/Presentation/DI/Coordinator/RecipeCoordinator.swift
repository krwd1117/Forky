import SwiftUI

final class RecipeCoordinator: Coordinator {
    public enum Path: Hashable {}
    
    var navigationPath = NavigationPath()
    
    func resetPath() {
        navigationPath = NavigationPath()
    }
}
