import SwiftUI

struct CardWalletView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Corporate Cards")
                .font(.title2.bold())
                .foregroundStyle(.white)

            RoundedRectangle(cornerRadius: 24)
                .fill(AppTheme.card)
                .frame(height: 220)
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 14) {
                        Text("ICBC BUSINESS")
                            .font(.caption.bold())
                            .foregroundStyle(.gray)

                        Spacer()

                        Text("****  ****  ****  8421")
                            .font(.title3.monospaced())
                            .foregroundStyle(.white)

                        HStack {
                            Text("VALID 03/30")
                            Spacer()
                            Text("USD")
                        }
                        .font(.caption)
                        .foregroundStyle(.gray)
                    }
                    .padding(20)
                }

            Spacer()
        }
        .padding(20)
        .background(AppTheme.background)
    }
}
