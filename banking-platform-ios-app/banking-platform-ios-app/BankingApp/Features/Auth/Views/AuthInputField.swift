import SwiftUI

struct AuthInputField: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    let systemImage: String
    var isSecure = false
    var trailingSystemImage: String?
    var trailingAction: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color.textSecondary.opacity(0.75))

            HStack(spacing: 12) {
                Image(systemName: systemImage)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.textSecondary.opacity(0.7))
                    .frame(width: 18)

                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                            .textInputAutocapitalization(.never)
                    }
                }
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.textPrimary)

                if let trailingSystemImage, let trailingAction {
                    Button(action: trailingAction) {
                        Image(systemName: trailingSystemImage)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(Color.textSecondary.opacity(0.7))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.bottom, 10)

            Rectangle()
                .fill(Color.black.opacity(0.08))
                .frame(height: 1)
        }
    }
}
