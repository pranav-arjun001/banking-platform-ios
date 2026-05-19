import SwiftUI

struct CardFormField: View {
    let title: String
    @Binding var text: String
    var systemImage: String?
    var trailingContent: AnyView?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: AppDimensions.CardFormField.titleFontSize, weight: .medium))
                .foregroundStyle(Color.textSecondary.opacity(0.7))
                .padding(.bottom, AppDimensions.CardFormField.titleBottomPadding)

            HStack(spacing: AppDimensions.CardFormField.contentSpacing) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: AppDimensions.CardFormField.iconFontSize, weight: .medium))
                        .foregroundStyle(Color.textSecondary.opacity(0.75))
                        .frame(width: AppDimensions.CardFormField.iconWidth)
                }

                TextField(title, text: $text)
                    .font(.system(size: AppDimensions.CardFormField.valueFontSize, weight: .medium))
                    .foregroundStyle(Color.textPrimary)
                    .textInputAutocapitalization(.never)

                if let trailingContent {
                    trailingContent
                }
            }

            Rectangle()
                .fill(Color.divider)
                .frame(height: AppDimensions.CardFormField.dividerHeight)
                .padding(.top, AppDimensions.CardFormField.dividerTopPadding)
        }
    }
}
