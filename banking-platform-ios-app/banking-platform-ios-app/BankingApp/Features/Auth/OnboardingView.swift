import SwiftUI

struct OnboardingView: View {
    @State private var viewModel = OnboardingViewModel()

    var body: some View {
        if viewModel.showsAuth {
            AuthView()
        } else {
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

                    PrimaryActionButton(title: "Next") {
                        viewModel.handleNext()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 34)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    OnboardingView()
}
