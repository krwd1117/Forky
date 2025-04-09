import Foundation
import ForkyDomain

import Alamofire

public final class DefaultRecipeRepository: RecipeRepository {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func fetchRecipes(recipeRequest: RecipeRequest) async throws -> RecipeResponse {
        
        let url = "https://us-central1-forky-89270.cloudfunctions.net/fetchRecipeFromOpenAI"
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: .post,
                parameters: recipeRequest,
                encoder: JSONParameterEncoder.default
            )
            .validate()
            .responseDecodable(of: RecipeResponse.self) { response in
                switch response.result {
                case .success(let recipeResponse):
                    continuation.resume(returning: recipeResponse)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
