//
//  DashboardView.swift
//  banking-platform-ios-app
//
//  Created by Pranav Arjun on 28/04/26.
//

import SwiftUI

struct DashboardView: View {
    @State private var viewModel = DashboardViewModel()

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
    }
}

#Preview {
    DashboardView()
}
