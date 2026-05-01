import SwiftUI

struct TransactionRowView: View {
    let transaction: DashboardTransaction

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .font(.headline)
                Text(transaction.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(transaction.amountText)
                .font(.subheadline.bold())
        }
        .padding(.vertical, 8)
    }
}
