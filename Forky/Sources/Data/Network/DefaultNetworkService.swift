import Foundation
import Alamofire

public final class DefaultNetworkService: NetworkService {
    public init() {}

    public func request(endpoint: URLRequest) async throws -> Data {
        let response = await AF.request(endpoint).serializingData().response
        switch response.result {
        case .success(let data): return data
        case .failure(let error): throw error
        }
    }
}
