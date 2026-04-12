import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            AnalyticsView()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                    Text("Analytics")
                }

            AssistantView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("AI")
                }

            CardWalletView()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Cards")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .tint(AppTheme.accent)
        .background(AppTheme.background.ignoresSafeArea())
    }
}
