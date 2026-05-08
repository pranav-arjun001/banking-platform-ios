import SwiftUI

struct TransactionRowView: View {
    let transaction: DashboardTransaction

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(Color.surfaceMuted)
                .frame(width: 46, height: 46)
                .overlay {
                    Image(systemName: transaction.iconSystemName)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(transaction.iconForegroundColor)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color.textPrimary)
                Text(transaction.subtitle)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.textSecondary)
            }

            Spacer()

            Text(transaction.amountText)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(transaction.amountColor)
        }
        .padding(.vertical, 10)
    }
}
