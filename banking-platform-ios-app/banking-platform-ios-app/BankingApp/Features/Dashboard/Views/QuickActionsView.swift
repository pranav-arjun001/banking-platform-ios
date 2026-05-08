import SwiftUI

struct QuickActionsView: View {
    let actions: [DashboardQuickAction]

    var body: some View {
        HStack(spacing: AppDimensions.QuickActionsView.containerSpacing) {
            ForEach(actions) { action in
                VStack(spacing: AppDimensions.QuickActionsView.itemSpacing) {
                    Circle()
                        .fill(Color.surfaceMuted)
                        .frame(
                            width: AppDimensions.QuickActionsView.iconContainerSize,
                            height: AppDimensions.QuickActionsView.iconContainerSize
                        )
                        .overlay {
                            Image(systemName: action.systemImage)
                                .font(.system(size: AppDimensions.QuickActionsView.iconFontSize, weight: .medium))
                                .foregroundStyle(Color.textPrimary)
                        }

                    Text(action.title)
                        .font(.system(size: AppDimensions.QuickActionsView.titleFontSize, weight: .medium))
                        .foregroundStyle(Color.textPrimary)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
