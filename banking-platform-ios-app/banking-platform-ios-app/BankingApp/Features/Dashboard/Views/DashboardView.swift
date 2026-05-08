//
//  DashboardView.swift
//  banking-platform-ios-app
//
//  Created by Pranav Arjun on 28/04/26.
//

import SwiftUI

struct DashboardView: View {
    private enum DashboardTab: String, CaseIterable, Identifiable {
        case home = "Home"
        case cards = "My Cards"
        case statistics = "Statistics"
        case settings = "Settings"

        var id: String { rawValue }

        var systemImage: String {
            switch self {
            case .home:
                return "house"
            case .cards:
                return "creditcard"
            case .statistics:
                return "chart.pie"
            case .settings:
                return "gearshape"
            }
        }
    }

    let userName: String
    let onSignOut: () -> Void

    @State private var viewModel: DashboardViewModel
    @State private var selectedTab: DashboardTab = .home

    init(userName: String, onSignOut: @escaping () -> Void) {
        self.userName = userName
        self.onSignOut = onSignOut
        _viewModel = State(initialValue: DashboardViewModel(userName: userName))
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.surface
                .ignoresSafeArea()

            Group {
                switch selectedTab {
                case .home:
                    homeContent
                case .cards:
                    placeholderView(title: "My Cards", subtitle: "Card management will appear here.")
                case .statistics:
                    placeholderView(title: "Statistics", subtitle: "Spending analytics will appear here.")
                case .settings:
                    settingsContent
                }
            }
            .safeAreaInset(edge: .bottom) {
                dashboardTabBar
            }
        }
    }

    private var homeContent: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 28) {
                HeaderView(userName: viewModel.userName)
                CardView(
                    cardNumber: viewModel.cardNumber,
                    cardholderName: viewModel.cardholderName,
                    expiryDate: viewModel.expiryDate,
                    cvv: viewModel.cvv
                )
                QuickActionsView(actions: viewModel.quickActions)
                TransactionListView(transactions: viewModel.transactions)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 120)
        }
    }

    private var settingsContent: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Settings")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(Color.textPrimary)
            Button("Sign Out") {
                onSignOut()
            }
            .buttonStyle(.borderedProminent)
            .tint(.accent)
            Spacer()
        }
        .padding(24)
    }

    private func placeholderView(title: String, subtitle: String) -> some View {
        VStack(spacing: 12) {
            Spacer()
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(Color.textPrimary)
            Text(subtitle)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color.textSecondary)
            Spacer()
        }
        .padding(24)
    }

    private var dashboardTabBar: some View {
        HStack {
            ForEach(DashboardTab.allCases) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 6) {
                        ZStack {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color.accent.opacity(0.12))
                                    .frame(width: 40, height: 30)
                            }

                            Image(systemName: tab.systemImage)
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(selectedTab == tab ? Color.accent : Color.textSecondary)
                        }

                        Text(tab.rawValue)
                            .font(.system(size: 13, weight: selectedTab == tab ? .semibold : .medium))
                            .foregroundStyle(selectedTab == tab ? Color.accent : Color.textSecondary)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 18)
        .padding(.top, 14)
        .padding(.bottom, 18)
        .background(Color.surface)
    }
}

#Preview {
    DashboardView(userName: "Aimal Naseem", onSignOut: {})
}
