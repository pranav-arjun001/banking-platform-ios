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

            VStack(spacing: 28) {
                OnboardingPageIndicator(
                    currentPage: viewModel.currentPage,
                    pageCount: viewModel.pages.count
                )

                VStack(spacing: 12) {
                    Text(viewModel.currentContent.title)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.textPrimary)

                    Text(viewModel.currentContent.subtitle)
                        .font(.system(size: 16, weight: .medium))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.textSecondary)
                        .lineSpacing(4)
                }
                .padding(.horizontal, 24)

                PrimaryButton(title: "Next") {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        if viewModel.handleNext() {
                            onFinished()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .padding(.bottom, 34)
        }
        .background(Color.white)
    }
}

#Preview {
    OnboardingView {
    }
}
