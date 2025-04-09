import SwiftUI



enum SearchPath: Hashable {
    case result(query: String)
    case filter
}

enum FavoritePath: Hashable {
    case detail(id: Int)
    case category(name: String)
}

enum ProfilePath: Hashable {
    case edit
    case settings
    case history
} 
