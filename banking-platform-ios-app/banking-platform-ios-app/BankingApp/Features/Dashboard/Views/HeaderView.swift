import SwiftUI

struct HeaderView: View {
    let userName: String

    var body: some View {
        HStack(spacing: AppDimensions.HeaderView.containerSpacing) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.iconMuted, Color.divider],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay {
                    Image(systemName: AppConstants.Dashboard.userAvatarIcon)
                        .font(.system(size: AppDimensions.HeaderView.avatarFontSize))
                        .foregroundStyle(Color.textSecondary.opacity(0.8))
                }
                .frame(width: AppDimensions.HeaderView.avatarSize, height: AppDimensions.HeaderView.avatarSize)

            VStack(alignment: .leading, spacing: AppDimensions.HeaderView.textSpacing) {
                Text(AppConstants.Dashboard.welcomeBackTitle)
                    .font(.system(size: AppDimensions.HeaderView.subtitleFontSize, weight: .medium))
                    .foregroundStyle(Color.textSecondary)
                Text(userName)
                    .font(.system(size: AppDimensions.HeaderView.titleFontSize, weight: .bold))
                    .foregroundStyle(Color.textPrimary)
            }

            Spacer()
        }
    }
}
