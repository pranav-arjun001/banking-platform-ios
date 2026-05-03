import Foundation

struct SignUpUseCase {
    let repository: AuthRepository

    func execute(
        fullName: String,
        phoneNumber: String,
        email: String,
        password: String
    ) async throws -> AuthenticatedUser {
        try await repository.signUp(
            fullName: fullName,
            phoneNumber: phoneNumber,
            email: email,
            password: password
        )
    }
}
