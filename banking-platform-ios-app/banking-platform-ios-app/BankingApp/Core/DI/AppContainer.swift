import Foundation

struct AppContainer {
    let apiClient: APIClient?
    let accountRepository: AccountRepository?
    let authRepository: AuthRepository

    init(
        apiClient: APIClient? = nil,
        accountRepository: AccountRepository? = nil,
        authRepository: AuthRepository = AuthRepositoryImpl(localStore: LocalStore())
    ) {
        self.apiClient = apiClient
        self.accountRepository = accountRepository
        self.authRepository = authRepository
    }
}
