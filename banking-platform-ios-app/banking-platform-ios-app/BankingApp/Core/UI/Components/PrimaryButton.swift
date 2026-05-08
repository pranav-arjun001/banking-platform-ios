import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: AppDimensions.PrimaryButton.titleFontSize, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: AppDimensions.PrimaryButton.height)
                .background(Color.accent)
                .clipShape(RoundedRectangle(cornerRadius: AppDimensions.PrimaryButton.cornerRadius))
        }
        .buttonStyle(.plain)
    }
}
