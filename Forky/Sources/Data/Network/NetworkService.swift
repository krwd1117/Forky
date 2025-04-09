import Foundation

public protocol NetworkService {
    func request(endpoint: URLRequest) async throws -> Data
}
