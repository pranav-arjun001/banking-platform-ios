import SwiftUI

struct QuickActionsView: View {
    let actions: [DashboardQuickAction]

    var body: some View {
        HStack(spacing: 18) {
            ForEach(actions) { action in
                VStack(spacing: 10) {
                    Circle()
                        .fill(Color.surfaceMuted)
                        .frame(width: 62, height: 62)
                        .overlay {
                            Image(systemName: action.systemImage)
                                .font(.system(size: 24, weight: .medium))
                                .foregroundStyle(Color.textPrimary)
                        }

                    Text(action.title)
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color.textPrimary)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
