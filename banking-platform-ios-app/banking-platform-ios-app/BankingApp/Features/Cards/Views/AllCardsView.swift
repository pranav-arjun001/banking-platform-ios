import SwiftUI

struct AllCardsView: View {
    let cards: [PaymentCard]
    let onAddCard: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Text(AppConstants.Cards.allCardsTitle)
                .font(.system(size: AppDimensions.CardsView.titleFontSize, weight: .semibold))
                .foregroundStyle(Color.textPrimary)
                .frame(height: AppDimensions.CardsView.headerHeight)
                .frame(maxWidth: .infinity)
                .padding(.top, AppDimensions.CardsView.topPadding)

            ScrollView(showsIndicators: false) {
                VStack(spacing: AppDimensions.CardsView.cardSpacing) {
                    ForEach(cards) { card in
                        PaymentCardView(card: card)
                    }
                }
                .padding(.horizontal, AppDimensions.CardsView.horizontalPadding)
                .padding(.top, AppDimensions.CardsView.cardSpacing)
                .padding(.bottom, AppDimensions.DashboardView.bottomPadding)
            }

            Button {
                onAddCard()
            } label: {
                HStack(spacing: AppDimensions.CardsView.addButtonSpacing) {
                    Text(AppConstants.Cards.addCardButtonTitle)
                    Image(systemName: AppConstants.Cards.addIcon)
                        .font(.system(size: AppDimensions.CardsView.addButtonIconFontSize, weight: .medium))
                }
                .font(.system(size: AppDimensions.PrimaryButton.titleFontSize, weight: .semibold))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: AppDimensions.PrimaryButton.height)
                .background(Color.accent)
                .clipShape(RoundedRectangle(cornerRadius: AppDimensions.PrimaryButton.cornerRadius))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, AppDimensions.CardsView.horizontalPadding)
            .padding(.bottom, AppDimensions.CardsView.addButtonBottomPadding)
        }
        .background(Color.surface)
    }
}

#Preview {
    AllCardsView(cards: CardsViewModel().cards, onAddCard: {})
}
