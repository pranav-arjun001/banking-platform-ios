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
        VStack(alignment: .leading, spacing: AppDimensions.AuthInputField.containerSpacing) {
            Text(title)
                .font(.system(size: AppDimensions.AuthInputField.titleFontSize, weight: .medium))
                .foregroundStyle(Color.textSecondary.opacity(0.75))

            HStack(spacing: AppDimensions.AuthInputField.contentSpacing) {
                Image(systemName: systemImage)
                    .font(.system(size: AppDimensions.AuthInputField.iconFontSize, weight: .medium))
                    .foregroundStyle(Color.textSecondary.opacity(0.7))
                    .frame(width: AppDimensions.AuthInputField.iconWidth)

                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                            .textInputAutocapitalization(.never)
                    }
                }
                .font(.system(size: AppDimensions.AuthInputField.textFontSize, weight: .medium))
                .foregroundStyle(Color.textPrimary)

                if let trailingSystemImage, let trailingAction {
                    Button(action: trailingAction) {
                        Image(systemName: trailingSystemImage)
                            .font(.system(size: AppDimensions.AuthInputField.iconFontSize, weight: .medium))
                            .foregroundStyle(Color.textSecondary.opacity(0.7))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.bottom, AppDimensions.AuthInputField.bottomPadding)

            Rectangle()
                .fill(Color.black.opacity(0.08))
                .frame(height: AppDimensions.AuthInputField.dividerHeight)
        }
    }
}
