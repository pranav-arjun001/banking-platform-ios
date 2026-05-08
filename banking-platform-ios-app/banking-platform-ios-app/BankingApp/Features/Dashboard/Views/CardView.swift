import SwiftUI

struct CardView: View {
    let cardNumber: String
    let cardholderName: String
    let expiryDate: String
    let cvv: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color.cardAccent, Color.cardDark],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                }

            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Image(systemName: "simcard")
                        .font(.system(size: 22))
                        .foregroundStyle(Color.white.opacity(0.7))

                    Spacer()

                    Image(systemName: "wave.3.right")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(Color.accent.opacity(0.9))
                }

                Text(cardNumber)
                    .font(.system(size: 22, weight: .medium, design: .rounded))
                    .foregroundStyle(Color.white)
                    .tracking(1.1)

                VStack(alignment: .leading, spacing: 14) {
                    Text(cardholderName)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(Color.white.opacity(0.95))

                    HStack(spacing: 30) {
                        cardMeta(title: "Expiry Date", value: expiryDate)
                        cardMeta(title: "CVV", value: cvv)
                        Spacer()
                        mastercardMark
                    }
                }
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 220)
    }

    private func cardMeta(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color.white.opacity(0.55))
            Text(value)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(Color.white)
        }
    }

    private var mastercardMark: some View {
        VStack(alignment: .trailing, spacing: 6) {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 26, height: 26)
                    .offset(x: -8)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 26, height: 26)
                    .offset(x: 8)
            }
            .frame(width: 50, height: 26)

            Text("Mastercard")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.white.opacity(0.95))
        }
    }
}
