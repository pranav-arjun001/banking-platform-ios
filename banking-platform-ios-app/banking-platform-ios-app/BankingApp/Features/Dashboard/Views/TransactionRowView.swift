import SwiftUI

struct TransactionRowView: View {
    let transaction: DashboardTransaction

    var body: some View {
        HStack(spacing: AppDimensions.TransactionRowView.containerSpacing) {
            Circle()
                .fill(Color.surfaceMuted)
                .frame(
                    width: AppDimensions.TransactionRowView.iconContainerSize,
                    height: AppDimensions.TransactionRowView.iconContainerSize
                )
                .overlay {
                    Image(systemName: transaction.iconSystemName)
                        .font(.system(size: AppDimensions.TransactionRowView.iconFontSize, weight: .semibold))
                        .foregroundStyle(transaction.iconForegroundColor)
                }

            VStack(alignment: .leading, spacing: AppDimensions.TransactionRowView.textSpacing) {
                Text(transaction.title)
                    .font(.system(size: AppDimensions.TransactionRowView.titleFontSize, weight: .semibold))
                    .foregroundStyle(Color.textPrimary)
                Text(transaction.subtitle)
                    .font(.system(size: AppDimensions.TransactionRowView.subtitleFontSize, weight: .medium))
                    .foregroundStyle(Color.textSecondary)
            }

            Spacer()

            Text(transaction.amountText)
                .font(.system(size: AppDimensions.TransactionRowView.amountFontSize, weight: .semibold))
                .foregroundStyle(transaction.amountColor)
        }
        .padding(.vertical, AppDimensions.TransactionRowView.verticalPadding)
    }
}
