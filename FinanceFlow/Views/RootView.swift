import SwiftUI

struct RootView: View {
//    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var hasCompletedOnboarding = false

    var body: some View {
        if hasCompletedOnboarding {
            FinanceTabView()
        } else {
            NavigationStack {
                OnboardingView {
                    withAnimation(.spring(response: 0.45, dampingFraction: 0.88)) {
                        hasCompletedOnboarding = true
                    }
                }
            }
            .tint(.ffPrimary)
        }
    }
}

struct FinanceTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeDashboardView(viewModel: HomeViewModel())
            }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            NavigationStack {
                SavingsView(viewModel: SavingsViewModel())
            }
                .tabItem {
                    Label("Savings", systemImage: "chart.pie.fill")
                }

            NavigationStack {
                WalletView(viewModel: WalletViewModel())
            }
                .tabItem {
                    Label("Wallet", systemImage: "creditcard.fill")
                }
        }
        .tint(.ffPrimary)
    }
}
