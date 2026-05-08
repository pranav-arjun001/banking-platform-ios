import SwiftUI

struct TransactionListView: View {
    let transactions: [DashboardTransaction]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Recent Transactions")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.textPrimary)

                Spacer()

                Button("See All") {
                }
                .buttonStyle(.plain)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.accent)
            }

            VStack(spacing: 6) {
                ForEach(transactions) { transaction in
                    TransactionRowView(transaction: transaction)
                }
            }
        }
    }
}
