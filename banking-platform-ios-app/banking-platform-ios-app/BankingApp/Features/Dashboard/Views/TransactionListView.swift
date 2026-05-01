import SwiftUI

struct TransactionListView: View {
    let transactions: [DashboardTransaction]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Transactions")
                .font(.headline)

            ForEach(transactions) { transaction in
                TransactionRowView(transaction: transaction)
            }
        }
    }
}
