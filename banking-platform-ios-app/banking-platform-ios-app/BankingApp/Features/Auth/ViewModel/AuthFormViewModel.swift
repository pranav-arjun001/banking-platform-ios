import Foundation

@Observable
final class AuthFormViewModel {
    enum Mode {
        case signIn
        case signUp
    }

    private let signInUseCase: SignInUseCase
    private let signUpUseCase: SignUpUseCase

    var mode: Mode = .signIn
    var fullName = ""
    var phoneNumber = ""
    var email = ""
    var password = ""
    var isPasswordVisible = false
    var isLoading = false
    var errorMessage: String?

    init(signInUseCase: SignInUseCase, signUpUseCase: SignUpUseCase) {
        self.signInUseCase = signInUseCase
        self.signUpUseCase = signUpUseCase
    }

    var title: String {
        mode == .signIn ? "Sign In" : "Sign Up"
    }

    var subtitle: String {
        mode == .signIn
            ? "Access your accounts securely."
            : "Create your account to start managing your finances."
    }

    var submitButtonTitle: String {
        isLoading ? "Please wait..." : title
    }

    var switchPrompt: String {
        mode == .signIn ? "I'm a new user." : "Already have an account."
    }

    var switchActionTitle: String {
        mode == .signIn ? "Sign Up" : "Sign In"
    }

    var canSubmit: Bool {
        if mode == .signIn {
            return isValidEmail(email) && password.count >= 6
        }

        return !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && isValidEmail(email)
            && password.count >= 6
    }

    func switchMode() {
        mode = mode == .signIn ? .signUp : .signIn
        errorMessage = nil
        password = ""
        isPasswordVisible = false
    }

    func submit() async -> AuthenticatedUser? {
        guard canSubmit else {
            errorMessage = validationMessage
            return nil
        }

        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            switch mode {
            case .signIn:
                return try await signInUseCase.execute(
                    email: normalizedEmail,
                    password: password
                )
            case .signUp:
                return try await signUpUseCase.execute(
                    fullName: fullName.trimmingCharacters(in: .whitespacesAndNewlines),
                    phoneNumber: phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines),
                    email: normalizedEmail,
                    password: password
                )
            }
        } catch {
            errorMessage = error.localizedDescription
            return nil
        }
    }

    private var normalizedEmail: String {
        email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

    private var validationMessage: String {
        if !isValidEmail(email) {
            return "Enter a valid email address."
        }

        if password.count < 6 {
            return "Password must be at least 6 characters."
        }

        if mode == .signUp && fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Enter your full name."
        }

        if mode == .signUp && phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Enter your phone number."
        }

        return "Complete all required fields."
    }

    private func isValidEmail(_ value: String) -> Bool {
        let value = value.trimmingCharacters(in: .whitespacesAndNewlines)
        let parts = value.split(separator: "@")
        guard parts.count == 2 else {
            return false
        }

        return parts[1].contains(".")
    }
}
