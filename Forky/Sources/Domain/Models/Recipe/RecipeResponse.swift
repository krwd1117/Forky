import Foundation

public struct RecipeResponse: Decodable {
    public let recipes: [Recipe]
    
    public init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}

public struct Recipe: Decodable, Identifiable {
    public var id: String { title }
    public let title: String
    public let description: String
    public let ingredientsUsed: [String]
    public let missingIngredients: [String]
    public let cookingTime: Int
    public let difficulty: String
    public let steps: [String]
    public let tips: String
    public let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case ingredientsUsed
        case missingIngredients
        case cookingTime
        case difficulty
        case steps
        case tips
        case imageURL
    }
} 
