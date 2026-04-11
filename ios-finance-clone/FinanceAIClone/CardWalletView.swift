import SwiftUI

struct CardWalletView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("My Cards")
                .font(.title2.bold())
                .foregroundStyle(AppTheme.primaryText)

            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(height: 210)
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("VISA")
                            .font(.caption.bold())
                            .foregroundStyle(.white.opacity(0.85))
                        Spacer()
                        Text("****  ****  ****  3871")
                            .font(.title3.monospaced())
                            .foregroundStyle(.white)
                        Text("Balance: $6,820.22")
                            .foregroundStyle(.white.opacity(0.9))
                    }
                    .padding(18)
                }

            SectionCard {
                Text("Spending Limits")
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryText)
                Text("Card utilization is 26%. You are within the healthy credit usage range.")
                    .font(.caption)
                    .foregroundStyle(AppTheme.secondaryText)
            }

            Spacer()
        }
        .padding()
        .background(AppTheme.background)
    }
}
