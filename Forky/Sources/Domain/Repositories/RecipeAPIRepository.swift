import Foundation

public protocol RecipeRepository {
    func fetchRecipes(recipeRequest: RecipeRequest) async throws -> RecipeResponse
}
