import Foundation

@Observable
final class DashboardViewModel {
    let userName = "Pranav"
    let balanceText = "$12,450.00"
    let quickActions: [DashboardQuickAction] = [
        DashboardQuickAction(title: "Transfer", systemImage: "arrow.left.arrow.right"),
        DashboardQuickAction(title: "Pay", systemImage: "creditcard"),
        DashboardQuickAction(title: "Top Up", systemImage: "plus.circle")
    ]
    let transactions: [DashboardTransaction] = [
        DashboardTransaction(title: "Coffee Shop", subtitle: "Today", amountText: "-$8.50"),
        DashboardTransaction(title: "Salary", subtitle: "Yesterday", amountText: "+$2,500.00"),
        DashboardTransaction(title: "Groceries", subtitle: "Monday", amountText: "-$64.20")
    ]
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
}
