import Foundation

protocol AuthRepository {
    func signIn(email: String, password: String) async throws -> AuthenticatedUser
    func signUp(fullName: String, phoneNumber: String, email: String, password: String) async throws -> AuthenticatedUser
    func currentUser() -> AuthenticatedUser?
    func signOut()
}
