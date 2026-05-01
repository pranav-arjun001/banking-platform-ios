import SwiftUI

struct CardView: View {
    let balanceText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Available Balance")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.8))
            Text(balanceText)
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.blue.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
