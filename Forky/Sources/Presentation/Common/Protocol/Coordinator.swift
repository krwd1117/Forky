import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype Path: Hashable
    var navigationPath: NavigationPath { get set }
    
    func resetPath()
}

extension Coordinator {
    func resetPath() {
        navigationPath = NavigationPath()
    }
} 
