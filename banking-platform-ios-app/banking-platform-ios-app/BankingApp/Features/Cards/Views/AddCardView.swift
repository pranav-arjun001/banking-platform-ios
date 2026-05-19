import SwiftUI

struct AddCardView: View {
    @Bindable var viewModel: CardsViewModel
    let onBack: () -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: AppDimensions.AddCardView.contentSpacing) {
                header

                PaymentCardView(card: viewModel.previewCard)

                VStack(spacing: AppDimensions.AddCardView.fieldSpacing) {
                    CardFormField(
                        title: AppConstants.Cards.cardholderNameTitle,
                        text: $viewModel.cardholderName,
                        systemImage: AppConstants.Cards.cardholderIcon
                    )

                    HStack(alignment: .top, spacing: AppDimensions.AddCardView.rowSpacing) {
                        CardFormField(title: AppConstants.Cards.expiryDateTitle, text: $viewModel.expiryDate)
                        CardFormField(title: AppConstants.Cards.cardSecurityCodeTitle, text: $viewModel.cvv)
                    }

                    CardFormField(
                        title: AppConstants.Cards.cardNumberTitle,
                        text: $viewModel.cardNumber,
                        systemImage: AppConstants.Cards.cardNumberIcon,
                        trailingContent: AnyView(mastercardMark)
                    )
                }
            }
            .padding(.horizontal, AppDimensions.AddCardView.horizontalPadding)
            .padding(.top, AppDimensions.AddCardView.topPadding)
        }
        .background(Color.surface)
    }

    private var header: some View {
        ZStack {
            Text(AppConstants.Cards.addNewCardTitle)
                .font(.system(size: AppDimensions.AddCardView.titleFontSize, weight: .semibold))
                .foregroundStyle(Color.textPrimary)

            HStack {
                Button(action: onBack) {
                    Image(systemName: AppConstants.Cards.backIcon)
                        .font(.system(size: AppDimensions.AddCardView.backButtonFontSize, weight: .medium))
                        .foregroundStyle(Color.textPrimary)
                        .frame(
                            width: AppDimensions.AddCardView.backButtonSize,
                            height: AppDimensions.AddCardView.backButtonSize
                        )
                        .background(Color.surfaceMuted)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)

                Spacer()
            }
        }
        .frame(height: AppDimensions.AddCardView.headerHeight)
    }

    private var mastercardMark: some View {
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
    }
}

#Preview {
    AddCardView(viewModel: CardsViewModel(), onBack: {})
}
