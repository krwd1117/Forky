import SwiftUI

enum Tab: Int, CaseIterable {
    case home
    case recipe
    case fork
    case refrigerator
    case myPage

    var title: String {
        switch self {
        case .home: return "홈"
        case .recipe: return "레시피"
        case .fork: return "Forky"
        case .refrigerator: return "냉장고"
        case .myPage: return "마이페이지"
        }
    }

    var icon: String {
        switch self {
        case .home: return "house"
        case .recipe: return "book"
        case .fork: return "fork.knife.circle"
        case .refrigerator: return "refrigerator" // 냉장고에 가장 가까운 시스템 아이콘
        case .myPage: return "person"
        }
    }

    var selectedIcon: String {
        switch self {
        case .home: return "house.fill"
        case .recipe: return "book.fill"
        case .fork: return "fork.knife.circle.fill"
        case .refrigerator: return "refrigerator.fill"
        case .myPage: return "person.fill"
        }
    }
}
