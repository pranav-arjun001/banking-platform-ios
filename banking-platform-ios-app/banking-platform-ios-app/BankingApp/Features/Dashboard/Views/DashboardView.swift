//
//  DashboardView.swift
//  banking-platform-ios-app
//
//  Created by Pranav Arjun on 28/04/26.
//

import SwiftUI

struct DashboardView: View {
    private enum DashboardTab: CaseIterable, Identifiable {
        case home
        case cards
        case statistics
        case settings

        var id: String { title }

        var title: String {
            switch self {
            case .home:
                return AppConstants.Dashboard.homeTabTitle
            case .cards:
                return AppConstants.Dashboard.cardsTabTitle
            case .statistics:
                return AppConstants.Dashboard.statisticsTabTitle
            case .settings:
                return AppConstants.Dashboard.settingsTabTitle
            }
        }

        var systemImage: String {
            switch self {
            case .home:
                return AppConstants.Dashboard.homeTabIcon
            case .cards:
                return AppConstants.Dashboard.cardsTabIcon
            case .statistics:
                return AppConstants.Dashboard.statisticsTabIcon
            case .settings:
                return AppConstants.Dashboard.settingsTabIcon
            }
        }
    }

    let userName: String
    let onSignOut: () -> Void

    @State private var viewModel: DashboardViewModel
    @State private var cardsViewModel = CardsViewModel()
    @State private var selectedTab: DashboardTab = .home
    @State private var isAddingCard = false

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
                    CardsView(viewModel: cardsViewModel, isAddingCard: $isAddingCard)
                case .statistics:
                    placeholderView(title: AppConstants.Dashboard.statisticsTabTitle, subtitle: AppConstants.Dashboard.statisticsPlaceholderSubtitle)
                case .settings:
                    settingsContent
                }
            }
            .safeAreaInset(edge: .bottom) {
                if showsDashboardTabBar {
                    dashboardTabBar
                }
            }
        }
    }

    private var showsDashboardTabBar: Bool {
        !(selectedTab == .cards && isAddingCard)
    }

    private var homeContent: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: AppDimensions.DashboardView.contentSpacing) {
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
            .padding(.horizontal, AppDimensions.DashboardView.horizontalPadding)
            .padding(.top, AppDimensions.DashboardView.topPadding)
            .padding(.bottom, AppDimensions.DashboardView.bottomPadding)
        }
    }

    private var settingsContent: some View {
        VStack(spacing: AppDimensions.DashboardView.settingsSpacing) {
            Spacer()
            Text(AppConstants.Dashboard.settingsTabTitle)
                .font(.system(size: AppDimensions.DashboardView.settingsTitleFontSize, weight: .bold))
                .foregroundStyle(Color.textPrimary)
            Button(AppConstants.Dashboard.signOutTitle) {
                onSignOut()
            }
            .buttonStyle(.borderedProminent)
            .tint(.accent)
            Spacer()
        }
        .padding(AppDimensions.DashboardView.settingsPadding)
    }

    private func placeholderView(title: String, subtitle: String) -> some View {
        VStack(spacing: AppDimensions.DashboardView.placeholderSpacing) {
            Spacer()
            Text(title)
                .font(.system(size: AppDimensions.DashboardView.placeholderTitleFontSize, weight: .bold))
                .foregroundStyle(Color.textPrimary)
            Text(subtitle)
                .font(.system(size: AppDimensions.DashboardView.placeholderSubtitleFontSize, weight: .medium))
                .foregroundStyle(Color.textSecondary)
            Spacer()
        }
        .padding(AppDimensions.DashboardView.placeholderPadding)
    }

    private var dashboardTabBar: some View {
        HStack {
            ForEach(DashboardTab.allCases) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: AppDimensions.DashboardView.tabItemSpacing) {
                        ZStack {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: AppDimensions.DashboardView.selectedBackgroundCornerRadius, style: .continuous)
                                    .fill(Color.accent.opacity(0.12))
                                    .frame(
                                        width: AppDimensions.DashboardView.selectedBackgroundWidth,
                                        height: AppDimensions.DashboardView.selectedBackgroundHeight
                                    )
                            }

                            Image(systemName: tab.systemImage)
                                .font(.system(size: AppDimensions.DashboardView.tabIconFontSize, weight: .medium))
                                .foregroundStyle(selectedTab == tab ? Color.accent : Color.textSecondary)
                        }

                        Text(tab.title)
                            .font(.system(size: AppDimensions.DashboardView.tabLabelFontSize, weight: selectedTab == tab ? .semibold : .medium))
                            .foregroundStyle(selectedTab == tab ? Color.accent : Color.textSecondary)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, AppDimensions.DashboardView.tabBarHorizontalPadding)
        .padding(.top, AppDimensions.DashboardView.tabBarTopPadding)
        .padding(.bottom, AppDimensions.DashboardView.tabBarBottomPadding)
        .background(Color.surface)
    }
}

#Preview {
    DashboardView(userName: AppConstants.Dashboard.sampleUserName, onSignOut: {})
}
