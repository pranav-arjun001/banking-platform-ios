import SwiftUI

struct AuthView: View {
    @State var viewModel: AuthFormViewModel

    let onBack: () -> Void
    let onAuthenticated: (AuthenticatedUser) -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    onBack()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color.textPrimary)
                        .frame(width: 44, height: 44)
                        .background(Color.black.opacity(0.03))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                .padding(.top, 12)

                VStack(alignment: .leading, spacing: 12) {
                    Text(viewModel.title)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(Color.textPrimary)

                    Text(viewModel.subtitle)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color.textSecondary)
                        .lineSpacing(4)
                }
                .padding(.top, 48)

                VStack(spacing: 18) {
                    if viewModel.mode == .signUp {
                        AuthInputField(
                            title: "Full Name",
                            text: $viewModel.fullName,
                            placeholder: "Aimal Naseem",
                            systemImage: "person"
                        )

                        AuthInputField(
                            title: "Phone Number",
                            text: $viewModel.phoneNumber,
                            placeholder: "+000 00 00 000",
                            systemImage: "phone"
                        )
                    }

                    AuthInputField(
                        title: "Email Address",
                        text: $viewModel.email,
                        placeholder: "aimalnaseem@gmail.com",
                        systemImage: "envelope"
                    )

                    AuthInputField(
                        title: "Password",
                        text: $viewModel.password,
                        placeholder: "Enter password",
                        systemImage: "lock",
                        isSecure: !viewModel.isPasswordVisible,
                        trailingSystemImage: viewModel.isPasswordVisible ? "eye.slash" : "eye",
                        trailingAction: {
                            viewModel.isPasswordVisible.toggle()
                        }
                    )
                }
                .padding(.top, 36)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.red)
                        .padding(.top, 18)
                }

                PrimaryButton(title: viewModel.submitButtonTitle) {
                    Task {
                        if let user = await viewModel.submit() {
                            onAuthenticated(user)
                        }
                    }
                }
                .opacity(viewModel.canSubmit ? 1 : 0.6)
                .disabled(!viewModel.canSubmit || viewModel.isLoading)
                .padding(.top, 36)

                HStack(spacing: 6) {
                    Text(viewModel.switchPrompt)
                        .foregroundStyle(Color.textSecondary)

                    Button(viewModel.switchActionTitle) {
                        viewModel.switchMode()
                    }
                    .foregroundStyle(Color.accent)
                }
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(.top, 28)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 34)
        }
        .background(Color.white)
    }
}

#Preview {
    AuthView(
        viewModel: AuthFormViewModel(
            signInUseCase: SignInUseCase(repository: AuthRepositoryImpl(localStore: LocalStore())),
            signUpUseCase: SignUpUseCase(repository: AuthRepositoryImpl(localStore: LocalStore()))
        ),
        onBack: {},
        onAuthenticated: { _ in }
    )
}
