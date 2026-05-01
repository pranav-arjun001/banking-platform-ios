import SwiftUI

struct OnboardingPageIndicator: View {
    let currentPage: Int
    let pageCount: Int
    @Namespace private var indicatorAnimation

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<pageCount, id: \.self) { index in
                ZStack {
                    Capsule()
                        .fill(Color(hex: "#D7DCE4"))
                        .frame(width: 6, height: 6)

                    if index == currentPage {
                        Capsule()
                            .fill(Color.accent)
                            .frame(width: 18, height: 6)
                            .matchedGeometryEffect(id: "activeIndicator", in: indicatorAnimation)
                    }
                }
                .frame(width: 18, height: 6)
            }
        }
        .animation(.spring(response: 0.32, dampingFraction: 0.82), value: currentPage)
    }
}
