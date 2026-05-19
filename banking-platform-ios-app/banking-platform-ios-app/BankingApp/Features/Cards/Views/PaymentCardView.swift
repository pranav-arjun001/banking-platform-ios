import SwiftUI

struct PaymentCardView: View {
    let card: PaymentCard

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppDimensions.PaymentCardView.cornerRadius, style: .continuous)
                .fill(background)
                .overlay(alignment: .center) {
                    Image(systemName: AppConstants.Cards.cardBackgroundIcon)
                        .font(.system(size: AppDimensions.PaymentCardView.backgroundIconSize, weight: .thin))
                        .foregroundStyle(Color.white.opacity(card.style == .blue ? 0.04 : 0.02))
                }

            content
                .padding(AppDimensions.PaymentCardView.contentPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity)
        .frame(height: AppDimensions.PaymentCardView.height)
        .clipShape(RoundedRectangle(cornerRadius: AppDimensions.PaymentCardView.cornerRadius, style: .continuous))
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: AppConstants.Cards.cardChipIcon)
                    .font(.system(size: AppDimensions.PaymentCardView.topIconSize))
                    .foregroundStyle(Color.cardAccent.opacity(0.9))

                Spacer()

                Image(systemName: AppConstants.Cards.cardContactlessIcon)
                    .font(.system(size: AppDimensions.PaymentCardView.topIconSize, weight: .medium))
                    .foregroundStyle(Color.accent.opacity(0.9))
            }

            Spacer(minLength: AppDimensions.PaymentCardView.contentSpacing)

            Text(card.cardNumber)
                .font(.system(size: AppDimensions.PaymentCardView.numberFontSize, weight: .medium, design: .rounded))
                .foregroundStyle(Color.white)

            Spacer(minLength: AppDimensions.PaymentCardView.brandCircleOffset)

            Text(card.cardholderName)
                .font(.system(size: AppDimensions.PaymentCardView.cardholderFontSize, weight: .medium))
                .foregroundStyle(Color.white)

            Spacer(minLength: AppDimensions.PaymentCardView.contentSpacing)

            HStack(alignment: .bottom, spacing: AppDimensions.PaymentCardView.metaSpacing) {
                cardMeta(title: AppConstants.Dashboard.cardExpiryTitle, value: card.expiryDate)

                if let cvv = card.cvv {
                    cardMeta(title: AppConstants.Dashboard.cardSecurityCodeTitle, value: cvv)
                }

                Spacer()

                brandMark
            }
        }
    }

    private var background: LinearGradient {
        switch card.style {
        case .blue:
            LinearGradient(
                colors: [Color.cardDark, Color.cardAccent.opacity(0.95), Color.cardDark],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .dark:
            LinearGradient(
                colors: [Color.border, Color.cardDark],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }

    private func cardMeta(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: AppDimensions.PaymentCardView.brandCircleOffset) {
            Text(title)
                .font(.system(size: AppDimensions.PaymentCardView.metaTitleFontSize, weight: .medium))
                .foregroundStyle(Color.white.opacity(0.58))

            Text(value)
                .font(.system(size: AppDimensions.PaymentCardView.metaValueFontSize, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }

    @ViewBuilder
    private var brandMark: some View {
        switch card.brand {
        case .mastercard:
            VStack(alignment: .trailing, spacing: AppDimensions.PaymentCardView.brandCircleOffset) {
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(
                            width: AppDimensions.PaymentCardView.brandCircleSize,
                            height: AppDimensions.PaymentCardView.brandCircleSize
                        )
                        .offset(x: -AppDimensions.PaymentCardView.brandCircleOffset)
                    Circle()
                        .fill(Color.orange)
                        .frame(
                            width: AppDimensions.PaymentCardView.brandCircleSize,
                            height: AppDimensions.PaymentCardView.brandCircleSize
                        )
                        .offset(x: AppDimensions.PaymentCardView.brandCircleOffset)
                }
                .frame(width: AppDimensions.PaymentCardView.brandMarkWidth, height: AppDimensions.PaymentCardView.brandMarkHeight)

                Text(AppConstants.Cards.mastercardTitle)
                    .font(.system(size: AppDimensions.PaymentCardView.brandFontSize, weight: .semibold))
                    .foregroundStyle(Color.white)
            }
        case .visa:
            Text(AppConstants.Cards.visaTitle)
                .font(.system(size: AppDimensions.PaymentCardView.visaFontSize, weight: .black).italic())
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    VStack {
        PaymentCardView(card: CardsViewModel().cards[0])
        PaymentCardView(card: CardsViewModel().cards[1])
    }
    .padding()
}
