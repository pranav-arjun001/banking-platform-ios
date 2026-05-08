import Foundation
import SwiftUI

@Observable
final class DashboardViewModel {
    let userName: String
    let cardholderName = "AR Jonson"
    let cardNumber = "4562  1122  4595  7852"
    let expiryDate = "24/2000"
    let cvv = "6986"
    let quickActions: [DashboardQuickAction] = [
        DashboardQuickAction(title: "Sent", systemImage: "arrow.up"),
        DashboardQuickAction(title: "Receive", systemImage: "arrow.down"),
        DashboardQuickAction(title: "Loan", systemImage: "dollarsign"),
        DashboardQuickAction(title: "Topup", systemImage: "arrow.up.to.line")
    ]
    let transactions: [DashboardTransaction] = [
        DashboardTransaction(
            title: "Apple Store",
            subtitle: "Entertainment",
            amountText: "- $5,99",
            amountColor: .textPrimary,
            iconSystemName: "applelogo",
            iconForegroundColor: .textPrimary
        ),
        DashboardTransaction(
            title: "Spotify",
            subtitle: "Music",
            amountText: "- $12,99",
            amountColor: .textPrimary,
            iconSystemName: "waveform",
            iconForegroundColor: .success
        ),
        DashboardTransaction(
            title: "Money Transfer",
            subtitle: "Transaction",
            amountText: "$300",
            amountColor: .accent,
            iconSystemName: "arrow.down",
            iconForegroundColor: .textPrimary
        ),
        DashboardTransaction(
            title: "Grocery",
            subtitle: "Shopping",
            amountText: "- $88",
            amountColor: .textPrimary,
            iconSystemName: "cart",
            iconForegroundColor: .orange
        )
    ]

    init(userName: String) {
        self.userName = userName
    }
}

struct DashboardQuickAction: Identifiable {
    let id = UUID()
    let title: String
    let systemImage: String
}

struct DashboardTransaction: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let amountText: String
    let amountColor: Color
    let iconSystemName: String
    let iconForegroundColor: Color
}
