public struct UseCases {
    public let fetchRecipe: FetchRecipeUseCase
    
    public init(
        fetchRecipe: FetchRecipeUseCase
    ) {
        self.fetchRecipe = fetchRecipe
    }
}
