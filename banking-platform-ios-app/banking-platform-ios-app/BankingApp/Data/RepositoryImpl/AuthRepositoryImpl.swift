import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private enum StorageKey {
        static let registeredUser = AppConstants.Storage.registeredUserKey
        static let sessionUser = AppConstants.Storage.sessionUserKey
    }

    private struct StoredUser: Codable {
        let fullName: String
        let phoneNumber: String
        let email: String
        let password: String

        var authenticatedUser: AuthenticatedUser {
            AuthenticatedUser(fullName: fullName, email: email, phoneNumber: phoneNumber)
        }
    }

    private enum AuthError: LocalizedError {
        case accountNotFound
        case invalidCredentials
        case accountAlreadyExists

        var errorDescription: String? {
            switch self {
            case .accountNotFound:
                return AppConstants.Auth.accountNotFoundError
            case .invalidCredentials:
                return AppConstants.Auth.invalidCredentialsError
            case .accountAlreadyExists:
                return AppConstants.Auth.accountAlreadyExistsError
            }
        }
    }

    let localStore: LocalStore

    func signIn(email: String, password: String) async throws -> AuthenticatedUser {
        try await Task.sleep(for: .milliseconds(AppConstants.Networking.authDelayMilliseconds))

        guard let storedUser = loadRegisteredUser() else {
            throw AuthError.accountNotFound
        }

        guard storedUser.email.caseInsensitiveCompare(email) == .orderedSame else {
            throw AuthError.accountNotFound
        }

        guard storedUser.password == password else {
            throw AuthError.invalidCredentials
        }

        saveSession(storedUser.authenticatedUser)
        return storedUser.authenticatedUser
    }

    func signUp(fullName: String, phoneNumber: String, email: String, password: String) async throws -> AuthenticatedUser {
        try await Task.sleep(for: .milliseconds(AppConstants.Networking.authDelayMilliseconds))

        if let storedUser = loadRegisteredUser(),
           storedUser.email.caseInsensitiveCompare(email) == .orderedSame {
            throw AuthError.accountAlreadyExists
        }

        let storedUser = StoredUser(
            fullName: fullName,
            phoneNumber: phoneNumber,
            email: email,
            password: password
        )

        let encoder = JSONEncoder()
        let data = try encoder.encode(storedUser)
        localStore.save(data, forKey: StorageKey.registeredUser)
        saveSession(storedUser.authenticatedUser)
        return storedUser.authenticatedUser
    }

    func currentUser() -> AuthenticatedUser? {
        guard let data = localStore.loadData(forKey: StorageKey.sessionUser) else {
            return nil
        }

        return try? JSONDecoder().decode(AuthenticatedUser.self, from: data)
    }

    func signOut() {
        localStore.removeValue(forKey: StorageKey.sessionUser)
    }

    private func loadRegisteredUser() -> StoredUser? {
        guard let data = localStore.loadData(forKey: StorageKey.registeredUser) else {
            return nil
        }

        return try? JSONDecoder().decode(StoredUser.self, from: data)
    }

    private func saveSession(_ user: AuthenticatedUser) {
        let encoder = JSONEncoder()

        guard let data = try? encoder.encode(user) else {
            return
        }

        localStore.save(data, forKey: StorageKey.sessionUser)
    }
}
