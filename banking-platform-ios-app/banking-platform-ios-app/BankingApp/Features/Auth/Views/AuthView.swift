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
                    Image(systemName: AppConstants.Auth.backIcon)
                        .font(.system(size: AppDimensions.AuthView.backButtonFontSize, weight: .semibold))
                        .foregroundStyle(Color.textPrimary)
                        .frame(width: AppDimensions.AuthView.backButtonSize, height: AppDimensions.AuthView.backButtonSize)
                        .background(Color.black.opacity(0.03))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                .padding(.top, AppDimensions.AuthView.backButtonTopPadding)

                VStack(alignment: .leading, spacing: AppDimensions.AuthView.titleSectionSpacing) {
                    Text(viewModel.title)
                        .font(.system(size: AppDimensions.AuthView.titleFontSize, weight: .bold))
                        .foregroundStyle(Color.textPrimary)

                    Text(viewModel.subtitle)
                        .font(.system(size: AppDimensions.AuthView.subtitleFontSize, weight: .medium))
                        .foregroundStyle(Color.textSecondary)
                        .lineSpacing(AppDimensions.AuthView.subtitleLineSpacing)
                }
                .padding(.top, AppDimensions.AuthView.titleTopPadding)

                VStack(spacing: AppDimensions.AuthView.formSpacing) {
                    if viewModel.mode == .signUp {
                        AuthInputField(
                            title: AppConstants.Auth.fullNameTitle,
                            text: $viewModel.fullName,
                            placeholder: AppConstants.Auth.fullNamePlaceholder,
                            systemImage: AppConstants.Auth.fullNameIcon
                        )

                        AuthInputField(
                            title: AppConstants.Auth.phoneNumberTitle,
                            text: $viewModel.phoneNumber,
                            placeholder: AppConstants.Auth.phoneNumberPlaceholder,
                            systemImage: AppConstants.Auth.phoneNumberIcon
                        )
                    }

                    AuthInputField(
                        title: AppConstants.Auth.emailTitle,
                        text: $viewModel.email,
                        placeholder: AppConstants.Auth.emailPlaceholder,
                        systemImage: AppConstants.Auth.emailIcon
                    )

                    AuthInputField(
                        title: AppConstants.Auth.passwordTitle,
                        text: $viewModel.password,
                        placeholder: AppConstants.Auth.passwordPlaceholder,
                        systemImage: AppConstants.Auth.passwordIcon,
                        isSecure: !viewModel.isPasswordVisible,
                        trailingSystemImage: viewModel.isPasswordVisible ? AppConstants.Auth.passwordVisibleIcon : AppConstants.Auth.passwordHiddenIcon,
                        trailingAction: {
                            viewModel.isPasswordVisible.toggle()
                        }
                    )
                }
                .padding(.top, AppDimensions.AuthView.formTopPadding)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.system(size: AppDimensions.AuthView.errorFontSize, weight: .medium))
                        .foregroundStyle(.red)
                        .padding(.top, AppDimensions.AuthView.errorTopPadding)
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
                .padding(.top, AppDimensions.AuthView.submitTopPadding)

                HStack(spacing: AppDimensions.AuthView.switchPromptSpacing) {
                    Text(viewModel.switchPrompt)
                        .foregroundStyle(Color.textSecondary)

                    Button(viewModel.switchActionTitle) {
                        viewModel.switchMode()
                    }
                    .foregroundStyle(Color.accent)
                }
                .font(.system(size: AppDimensions.AuthView.switchPromptFontSize, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(.top, AppDimensions.AuthView.switchPromptTopPadding)
            }
            .padding(.horizontal, AppDimensions.AuthView.horizontalPadding)
            .padding(.bottom, AppDimensions.AuthView.bottomPadding)
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
