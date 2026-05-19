import Foundation
import SwiftUI

@Observable
final class CardsViewModel {
    var cardholderName = AppConstants.Cards.sampleCardholderName
    var expiryDate = AppConstants.Cards.addCardExpiryDate
    var cvv = AppConstants.Cards.sampleCVV
    var cardNumber = AppConstants.Cards.sampleCardNumber

    let cards: [PaymentCard] = [
        PaymentCard(
            cardholderName: AppConstants.Cards.sampleCardholderName,
            cardNumber: AppConstants.Cards.displayCardNumber,
            expiryDate: AppConstants.Cards.sampleExpiryDate,
            cvv: AppConstants.Cards.sampleCVV,
            brand: .mastercard,
            style: .blue
        ),
        PaymentCard(
            cardholderName: AppConstants.Cards.sampleCardholderName,
            cardNumber: AppConstants.Cards.sampleCardNumber,
            expiryDate: AppConstants.Cards.sampleExpiryDate,
            cvv: nil,
            brand: .visa,
            style: .dark
        )
    ]

    var previewCard: PaymentCard {
        PaymentCard(
            cardholderName: cardholderName,
            cardNumber: AppConstants.Cards.displayCardNumber,
            expiryDate: AppConstants.Cards.sampleExpiryDate,
            cvv: cvv,
            brand: .mastercard,
            style: .blue
        )
    }
}

struct PaymentCard: Identifiable {
    enum Brand {
        case mastercard
        case visa
    }

    enum Style {
        case blue
        case dark
    }

    let id = UUID()
    let cardholderName: String
    let cardNumber: String
    let expiryDate: String
    let cvv: String?
    let brand: Brand
    let style: Style
}
