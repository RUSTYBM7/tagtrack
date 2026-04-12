import SwiftUI

@main
struct FinanceAICloneApp: App {
    @State private var hasSeenWelcome = false

    var body: some Scene {
        WindowGroup {
            Group {
                if hasSeenWelcome {
                    RootTabView()
                } else {
                    WelcomeView {
                        withAnimation(.easeInOut) {
                            hasSeenWelcome = true
                        }
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
