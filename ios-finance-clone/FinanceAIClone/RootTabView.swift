import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            AnalyticsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Insights")
                }

            CardWalletView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Cards")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Me")
                }
        }
        .tint(AppTheme.alert)
        .background(AppTheme.background.ignoresSafeArea())
    }
}
