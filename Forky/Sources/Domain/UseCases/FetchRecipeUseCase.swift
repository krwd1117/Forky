import Foundation

public protocol FetchRecipeUseCase {
    func execute(recipeRequest: RecipeRequest) async throws -> RecipeResponse
}
