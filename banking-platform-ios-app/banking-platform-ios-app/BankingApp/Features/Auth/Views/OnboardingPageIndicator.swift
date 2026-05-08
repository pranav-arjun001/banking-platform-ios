import SwiftUI

struct OnboardingPageIndicator: View {
    let currentPage: Int
    let pageCount: Int
    @Namespace private var indicatorAnimation

    var body: some View {
        HStack(spacing: AppDimensions.OnboardingPageIndicator.spacing) {
            ForEach(0..<pageCount, id: \.self) { index in
                ZStack {
                    Capsule()
                        .fill(Color(hex: AppConstants.Onboarding.inactiveIndicatorHex))
                        .frame(
                            width: AppDimensions.OnboardingPageIndicator.inactiveIndicatorWidth,
                            height: AppDimensions.OnboardingPageIndicator.inactiveIndicatorHeight
                        )

                    if index == currentPage {
                        Capsule()
                            .fill(Color.accent)
                            .frame(
                                width: AppDimensions.OnboardingPageIndicator.activeIndicatorWidth,
                                height: AppDimensions.OnboardingPageIndicator.activeIndicatorHeight
                            )
                            .matchedGeometryEffect(id: AppConstants.Onboarding.activeIndicatorID, in: indicatorAnimation)
                    }
                }
                .frame(width: AppDimensions.OnboardingPageIndicator.itemWidth, height: AppDimensions.OnboardingPageIndicator.itemHeight)
            }
        }
        .animation(.spring(response: 0.32, dampingFraction: 0.82), value: currentPage)
    }
}
