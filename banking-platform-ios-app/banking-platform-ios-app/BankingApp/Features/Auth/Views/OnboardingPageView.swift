import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        VStack {
            Spacer(minLength: AppDimensions.OnboardingPageView.topSpacerMinLength)

            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(
                    maxWidth: AppDimensions.OnboardingPageView.imageMaxWidth,
                    maxHeight: AppDimensions.OnboardingPageView.imageMaxHeight
                )
                .accessibilityHidden(true)

            Spacer(minLength: AppDimensions.OnboardingPageView.bottomSpacerMinLength)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
