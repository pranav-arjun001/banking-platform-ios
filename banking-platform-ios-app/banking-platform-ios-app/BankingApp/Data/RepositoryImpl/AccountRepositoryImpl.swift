import Foundation

struct AccountRepositoryImpl: AccountRepository {
    let api: AccountsAPI

    func fetchAccounts() async throws -> [Account] {
        let data = try await api.fetchAccounts()
        let decoder = JSONDecoder()
        let accounts = try decoder.decode([AccountDTO].self, from: data)
        return accounts.map { $0.toDomain() }
    }
}
