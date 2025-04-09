import Foundation
import ForkyDomain

public final class DefaultFetchRecipeUseCase: FetchRecipeUseCase {
    private let repository: RecipeRepository

    public init(repository: RecipeRepository) {
        self.repository = repository
    }

    public func execute(recipeRequest: RecipeRequest) async throws -> RecipeResponse {
        try await repository.fetchRecipes(recipeRequest: recipeRequest)
    }
}
