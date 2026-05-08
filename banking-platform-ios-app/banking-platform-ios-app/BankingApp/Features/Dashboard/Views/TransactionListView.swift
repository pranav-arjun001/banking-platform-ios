import SwiftUI

struct TransactionListView: View {
    let transactions: [DashboardTransaction]

    var body: some View {
        VStack(alignment: .leading, spacing: AppDimensions.TransactionListView.containerSpacing) {
            HStack {
                Text(AppConstants.Dashboard.recentTransactionsTitle)
                    .font(.system(size: AppDimensions.TransactionListView.titleFontSize, weight: .bold))
                    .foregroundStyle(Color.textPrimary)

                Spacer()

                Button(AppConstants.Dashboard.seeAllTitle) {
                }
                .buttonStyle(.plain)
                .font(.system(size: AppDimensions.TransactionListView.actionFontSize, weight: .semibold))
                .foregroundStyle(Color.accent)
            }

            VStack(spacing: AppDimensions.TransactionListView.listSpacing) {
                ForEach(transactions) { transaction in
                    TransactionRowView(transaction: transaction)
                }
            }
        }
    }
}
