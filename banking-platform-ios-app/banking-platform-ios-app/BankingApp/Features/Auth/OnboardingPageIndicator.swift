import SwiftUI

struct OnboardingPageIndicator: View {
    let currentPage: Int
    let pageCount: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<pageCount, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? Color.accent : Color(hex: "#D7DCE4"))
                    .frame(width: index == currentPage ? 18 : 6, height: 6)
            }
        }
    }
}
