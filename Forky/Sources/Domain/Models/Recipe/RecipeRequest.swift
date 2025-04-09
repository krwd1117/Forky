 import Foundation

public struct RecipeRequest: Encodable {
    public let ingredients: [String]
    public let equipment: [String]
    public let avoid: [String]
    public let maxCookingTime: Int
    public let mealType: String
    public let diet: String
    public let language: String
    
    public init(
        ingredients: [String],
        equipment: [String],
        avoid: [String],
        maxCookingTime: Int,
        mealType: String,
        diet: String,
        language: String = "ko"
    ) {
        self.ingredients = ingredients
        self.equipment = equipment
        self.avoid = avoid
        self.maxCookingTime = maxCookingTime
        self.mealType = mealType
        self.diet = diet
        self.language = language
    }
}
