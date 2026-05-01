import SwiftUI

struct HeaderView: View {
    let userName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Welcome back")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(userName)
                .font(.title2.bold())
        }
    }
}
