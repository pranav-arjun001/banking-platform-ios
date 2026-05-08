import SwiftUI

struct HeaderView: View {
    let userName: String

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.iconMuted, Color.divider],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 34))
                        .foregroundStyle(Color.textSecondary.opacity(0.8))
                }
                .frame(width: 56, height: 56)

            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome back,")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.textSecondary)
                Text(userName)
                    .font(.system(size: 31, weight: .bold))
                    .foregroundStyle(Color.textPrimary)
            }

            Spacer()
        }
    }
}
