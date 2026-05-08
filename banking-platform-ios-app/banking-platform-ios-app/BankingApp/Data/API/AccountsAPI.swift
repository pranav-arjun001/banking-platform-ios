import Foundation

struct AccountsAPI {
    let client: APIClient

    func fetchAccounts() async throws -> Data {
        try await client.request(path: AppConstants.Networking.accountsPath)
    }
}
