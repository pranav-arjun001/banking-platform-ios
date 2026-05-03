import Foundation

struct SignInUseCase {
    let repository: AuthRepository

    func execute(email: String,
                 password: String
    ) async throws -> AuthenticatedUser {
        try await repository.signIn(email: email, password: password)
    }
}
