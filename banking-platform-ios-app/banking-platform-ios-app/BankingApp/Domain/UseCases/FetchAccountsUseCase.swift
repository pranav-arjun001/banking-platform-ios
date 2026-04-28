import Foundation

struct FetchAccountsUseCase {
    let repository: AccountRepository

    func execute() async throws -> [Account] {
        try await repository.fetchAccounts()
    }
}
