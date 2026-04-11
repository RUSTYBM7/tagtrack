import SwiftUI

struct AnalyticsView: View {
    var maxSpend: Double { SampleData.weeklySpend.max() ?? 1 }

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Weekly Analytics")
                .font(.title2.bold())
                .foregroundStyle(.white)

            Text("Spending Trend")
                .foregroundStyle(.gray)

            HStack(alignment: .bottom, spacing: 10) {
                ForEach(Array(SampleData.weeklySpend.enumerated()), id: \.offset) { index, value in
                    VStack {
                        Spacer(minLength: 0)
                        RoundedRectangle(cornerRadius: 8)
                            .fill(index == 5 ? Color.mint : Color.white.opacity(0.2))
                            .frame(height: max(20, CGFloat(value / maxSpend) * 170))
                        Text(["M", "T", "W", "T", "F", "S", "S"][index])
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .frame(height: 220)
            .padding()
            .background(Color.white.opacity(0.04), in: RoundedRectangle(cornerRadius: 20))

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.black)
    }
}
