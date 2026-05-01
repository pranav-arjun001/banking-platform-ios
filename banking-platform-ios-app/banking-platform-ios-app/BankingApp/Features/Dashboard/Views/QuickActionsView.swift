import SwiftUI

struct QuickActionsView: View {
    let actions: [DashboardQuickAction]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Actions")
                .font(.headline)

            HStack(spacing: 12) {
                ForEach(actions) { action in
                    VStack(spacing: 8) {
                        Image(systemName: action.systemImage)
                            .font(.title3)
                        Text(action.title)
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.gray.opacity(0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
    }
}
