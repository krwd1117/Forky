import Foundation
import ForkyPresentation
import ForkyData
import ForkyDomain

struct AppAssembly {
    static func makeDIContainer() -> DIContainer {
        
        let networkService = DefaultNetworkService()
        
        let repository = DefaultRecipeRepository(networkService: networkService)
        
        let useCase = UseCases(fetchRecipe: DefaultFetchRecipeUseCase(repository: repository))

        return DIContainer(useCase: useCase)
    }
}
