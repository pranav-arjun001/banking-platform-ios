import Foundation

enum CurrencyFormatter {
    static func format(amount: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: amount as NSDecimalNumber) ?? "\(amount)"
    }
}
