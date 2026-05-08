import SwiftUI

struct CardView: View {
    let cardNumber: String
    let cardholderName: String
    let expiryDate: String
    let cvv: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppDimensions.CardView.cornerRadius, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color.cardAccent, Color.cardDark],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay {
                    RoundedRectangle(cornerRadius: AppDimensions.CardView.cornerRadius, style: .continuous)
                        .stroke(Color.white.opacity(0.08), lineWidth: AppDimensions.CardView.borderLineWidth)
                }

            VStack(alignment: .leading, spacing: AppDimensions.CardView.contentSpacing) {
                HStack {
                    Image(systemName: AppConstants.Dashboard.cardChipIcon)
                        .font(.system(size: AppDimensions.CardView.chipFontSize))
                        .foregroundStyle(Color.white.opacity(0.7))

                    Spacer()

                    Image(systemName: AppConstants.Dashboard.cardContactlessIcon)
                        .font(.system(size: AppDimensions.CardView.contactlessFontSize, weight: .medium))
                        .foregroundStyle(Color.accent.opacity(0.9))
                }

                Text(cardNumber)
                    .font(.system(size: AppDimensions.CardView.cardNumberFontSize, weight: .medium, design: .rounded))
                    .foregroundStyle(Color.white)
                    .tracking(AppDimensions.CardView.cardNumberTracking)

                VStack(alignment: .leading, spacing: AppDimensions.CardView.detailsSpacing) {
                    Text(cardholderName)
                        .font(.system(size: AppDimensions.CardView.cardholderFontSize, weight: .semibold))
                        .foregroundStyle(Color.white.opacity(0.95))

                    HStack(spacing: AppDimensions.CardView.metaSpacing) {
                        cardMeta(title: AppConstants.Dashboard.cardExpiryTitle, value: expiryDate)
                        cardMeta(title: AppConstants.Dashboard.cardSecurityCodeTitle, value: cvv)
                        Spacer()
                        mastercardMark
                    }
                }
            }
            .padding(AppDimensions.CardView.contentPadding)
        }
        .frame(maxWidth: .infinity)
        .frame(height: AppDimensions.CardView.cardHeight)
    }

    private func cardMeta(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: AppDimensions.CardView.metaTextSpacing) {
            Text(title)
                .font(.system(size: AppDimensions.CardView.metaTitleFontSize, weight: .medium))
                .foregroundStyle(Color.white.opacity(0.55))
            Text(value)
                .font(.system(size: AppDimensions.CardView.metaValueFontSize, weight: .semibold))
                .foregroundStyle(Color.white)
        }
    }

    private var mastercardMark: some View {
        VStack(alignment: .trailing, spacing: AppDimensions.CardView.brandSpacing) {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: AppDimensions.CardView.brandCircleSize, height: AppDimensions.CardView.brandCircleSize)
                    .offset(x: -AppDimensions.CardView.brandOffset)
                Circle()
                    .fill(Color.orange)
                    .frame(width: AppDimensions.CardView.brandCircleSize, height: AppDimensions.CardView.brandCircleSize)
                    .offset(x: AppDimensions.CardView.brandOffset)
            }
            .frame(width: AppDimensions.CardView.brandFrameWidth, height: AppDimensions.CardView.brandFrameHeight)

            Text(AppConstants.Dashboard.cardBrandTitle)
                .font(.system(size: AppDimensions.CardView.brandFontSize, weight: .semibold))
                .foregroundStyle(Color.white.opacity(0.95))
        }
    }
}
