import Foundation

protocol AccountRepository {
    func fetchAccounts() async throws -> [Account]
}
