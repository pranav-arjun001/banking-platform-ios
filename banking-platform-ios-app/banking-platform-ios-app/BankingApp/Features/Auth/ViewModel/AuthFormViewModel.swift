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
    var fullName = AppConstants.General.emptyString
    var phoneNumber = AppConstants.General.emptyString
    var email = AppConstants.General.emptyString
    var password = AppConstants.General.emptyString
    var isPasswordVisible = false
    var isLoading = false
    var errorMessage: String?

    init(signInUseCase: SignInUseCase, signUpUseCase: SignUpUseCase) {
        self.signInUseCase = signInUseCase
        self.signUpUseCase = signUpUseCase
    }

    var title: String {
        mode == .signIn ? AppConstants.Auth.signInTitle : AppConstants.Auth.signUpTitle
    }

    var subtitle: String {
        mode == .signIn
            ? AppConstants.Auth.signInSubtitle
            : AppConstants.Auth.signUpSubtitle
    }

    var submitButtonTitle: String {
        isLoading ? AppConstants.Auth.loadingTitle : title
    }

    var switchPrompt: String {
        mode == .signIn ? AppConstants.Auth.newUserPrompt : AppConstants.Auth.existingUserPrompt
    }

    var switchActionTitle: String {
        mode == .signIn ? AppConstants.Auth.signUpTitle : AppConstants.Auth.signInTitle
    }

    var canSubmit: Bool {
        if mode == .signIn {
            return isValidEmail(email) && password.count >= AppConstants.Validation.minimumPasswordLength
        }

        return !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && isValidEmail(email)
            && password.count >= AppConstants.Validation.minimumPasswordLength
    }

    func switchMode() {
        mode = mode == .signIn ? .signUp : .signIn
        errorMessage = nil
        password = AppConstants.General.emptyString
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
            return AppConstants.Auth.emailValidation
        }

        if password.count < AppConstants.Validation.minimumPasswordLength {
            return AppConstants.Auth.passwordValidation
        }

        if mode == .signUp && fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return AppConstants.Auth.fullNameValidation
        }

        if mode == .signUp && phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return AppConstants.Auth.phoneNumberValidation
        }

        return AppConstants.Auth.completeFieldsValidation
    }

    private func isValidEmail(_ value: String) -> Bool {
        let value = value.trimmingCharacters(in: .whitespacesAndNewlines)
        let parts = value.split(separator: Character(AppConstants.Validation.emailSeparator))
        guard parts.count == AppConstants.Validation.requiredEmailPartCount else {
            return false
        }

        return parts[1].contains(AppConstants.Validation.emailDomainSeparator)
    }
}
