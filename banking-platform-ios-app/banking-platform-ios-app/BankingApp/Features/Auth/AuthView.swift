import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 16) {
                Text("Welcome")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(Color.textPrimary)

                Text("Login to continue or create a new account to get started.")
                    .font(.system(size: 16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.textSecondary)
                    .lineSpacing(4)
                    .padding(.horizontal, 20)
            }

            Spacer()

            VStack(spacing: 14) {
                PrimaryActionButton(title: "Login") {
                }

                Button {
                } label: {
                    Text("New Registration")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color.accent)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.accent, lineWidth: 1.5)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 34)
        }
        .background(Color.white)
    }
}

#Preview {
    AuthView()
}
