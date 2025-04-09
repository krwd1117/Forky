import SwiftUI

enum Tab: Int, CaseIterable {
    case home
    
    var title: String {
        switch self {
        case .home: return "홈"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house"
        }
    }
    
    var selectedIcon: String {
        switch self {
        case .home: return "house.fill"
        }
    }
} 
