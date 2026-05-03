//
//  DashboardView.swift
//  banking-platform-ios-app
//
//  Created by Pranav Arjun on 28/04/26.
//

import SwiftUI

struct DashboardView: View {
    let userName: String
    let onSignOut: () -> Void

    @State private var viewModel: DashboardViewModel

    init(userName: String, onSignOut: @escaping () -> Void) {
        self.userName = userName
        self.onSignOut = onSignOut
        _viewModel = State(initialValue: DashboardViewModel(userName: userName))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HeaderView(userName: viewModel.userName)
                CardView(balanceText: viewModel.balanceText)
                QuickActionsView(actions: viewModel.quickActions)
                TransactionListView(transactions: viewModel.transactions)
            }
            .padding()
        }
        .safeAreaInset(edge: .top) {
            HStack {
                Spacer()

                Button("Sign Out") {
                    onSignOut()
                }
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.accent)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .background(Color.white)
        }
    }
}

#Preview {
    DashboardView(userName: "Aimal Naseem", onSignOut: {})
}
