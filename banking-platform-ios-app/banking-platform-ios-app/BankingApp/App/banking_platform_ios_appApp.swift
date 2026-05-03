//
//  banking_platform_ios_appApp.swift
//  banking-platform-ios-app
//
//  Created by Pranav Arjun on 28/04/26.
//

import SwiftUI

@main
struct banking_platform_ios_appApp: App {
    @State private var viewModel = AppFlowViewModel(container: AppContainer())

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $viewModel.path) {
                OnboardingView {
                    viewModel.showAuth()
                }
                .navigationBarBackButtonHidden(true)
                .navigationDestination(for: AppFlowViewModel.Route.self) { route in
                    switch route {
                    case .auth:
                        AuthView(
                            viewModel: viewModel.makeAuthFormViewModel(),
                            onBack: {
                                viewModel.showOnboarding()
                            },
                            onAuthenticated: { user in
                                viewModel.handleAuthenticated(user)
                            }
                        )
                        .navigationBarBackButtonHidden(true)
                    case .dashboard:
                        DashboardView(
                            userName: viewModel.currentUser?.fullName ?? "Customer",
                            onSignOut: {
                                viewModel.signOut()
                            }
                        )
                        .navigationBarBackButtonHidden(true)
                    }
                }
            }
        }
    }
}
