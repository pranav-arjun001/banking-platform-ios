import SwiftUI

struct CardsView: View {
    @Bindable var viewModel: CardsViewModel
    @Binding var isAddingCard: Bool

    var body: some View {
        Group {
            if isAddingCard {
                AddCardView(viewModel: viewModel) {
                    isAddingCard = false
                }
            } else {
                AllCardsView(cards: viewModel.cards) {
                    isAddingCard = true
                }
            }
        }
    }
}
