import Foundation

@Observable
final class AppFlowViewModel {
    enum Route: Hashable {
        case auth
        case dashboard
    }

    private let authRepository: AuthRepository
    private let signInUseCase: SignInUseCase
    private let signUpUseCase: SignUpUseCase

    var path: [Route]
    var currentUser: AuthenticatedUser?

    init(container: AppContainer) {
        authRepository = container.authRepository
        signInUseCase = SignInUseCase(repository: container.authRepository)
        signUpUseCase = SignUpUseCase(repository: container.authRepository)
        let persistedUser = container.authRepository.currentUser()
        currentUser = persistedUser
        path = persistedUser == nil ? [] : [.auth, .dashboard]
    }

    func makeAuthFormViewModel() -> AuthFormViewModel {
        AuthFormViewModel(
            signInUseCase: signInUseCase,
            signUpUseCase: signUpUseCase
        )
    }

    func showAuth() {
        path = [.auth]
    }

    func showOnboarding() {
        path.removeAll()
    }

    func handleAuthenticated(_ user: AuthenticatedUser) {
        currentUser = user
        path = [.auth, .dashboard]
    }

    func signOut() {
        authRepository.signOut()
        currentUser = nil
        path = [.auth]
    }
}
