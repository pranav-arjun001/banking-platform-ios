import SwiftUI

struct OnboardingView: View {
    let onFinished: () -> Void

    @State private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $viewModel.currentPage) {
                ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) { index, page in
                    OnboardingPageView(page: page)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            VStack(spacing: AppDimensions.OnboardingView.contentSpacing) {
                OnboardingPageIndicator(
                    currentPage: viewModel.currentPage,
                    pageCount: viewModel.pages.count
                )

                VStack(spacing: AppDimensions.OnboardingView.textSpacing) {
                    Text(viewModel.currentContent.title)
                        .font(.system(size: AppDimensions.OnboardingView.titleFontSize, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.textPrimary)

                    Text(viewModel.currentContent.subtitle)
                        .font(.system(size: AppDimensions.OnboardingView.subtitleFontSize, weight: .medium))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.textSecondary)
                        .lineSpacing(AppDimensions.OnboardingView.subtitleLineSpacing)
                }
                .padding(.horizontal, AppDimensions.OnboardingView.textHorizontalPadding)

                PrimaryButton(title: AppConstants.Onboarding.nextButtonTitle) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        if viewModel.handleNext() {
                            onFinished()
                        }
                    }
                }
            }
            .padding(.horizontal, AppDimensions.OnboardingView.horizontalPadding)
            .padding(.top, AppDimensions.OnboardingView.topPadding)
            .padding(.bottom, AppDimensions.OnboardingView.bottomPadding)
        }
        .background(Color.white)
    }
}

#Preview {
    OnboardingView {
    }
}
