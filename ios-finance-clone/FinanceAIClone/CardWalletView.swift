import SwiftUI

struct CardWalletView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("My Cards")
                .font(.title2.bold())
                .foregroundStyle(.white)

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

            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}
