import Foundation
import SwiftUI

@Observable
final class DashboardViewModel {
    let userName: String
    let cardholderName = AppConstants.Dashboard.sampleCardholderName
    let cardNumber = AppConstants.Dashboard.sampleCardNumber
    let expiryDate = AppConstants.Dashboard.sampleExpiryDate
    let cvv = AppConstants.Dashboard.sampleCVV
    let quickActions = [
        DashboardQuickAction(title: "Sent", systemImage: "arrow.up"),
        DashboardQuickAction(title: "Receive", systemImage: "arrow.down"),
        DashboardQuickAction(title: "Loan", systemImage: "dollarsign"),
        DashboardQuickAction(title: "Topup", systemImage: "arrow.up.to.line")
    ]
    let transactions = [
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
