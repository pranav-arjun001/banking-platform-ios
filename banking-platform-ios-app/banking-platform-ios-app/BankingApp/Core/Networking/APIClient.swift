import Foundation

protocol APIClient {
    func request(path: String) async throws -> Data
}
