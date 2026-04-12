import SwiftUI

struct AnalyticsView: View {
    private var maxSpend: Double { SampleData.weeklySpend.map(\.value).max() ?? 1 }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Weekly Analytics")
                    .font(.title2.bold())
                    .foregroundStyle(AppTheme.primaryText)

                SectionCard {
                    Text("Spending Trend")
                        .foregroundStyle(AppTheme.secondaryText)

                    HStack(alignment: .bottom, spacing: 10) {
                        ForEach(SampleData.weeklySpend) { point in
                            VStack(spacing: 6) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(point.day == "Sat" ? AppTheme.accent : Color.white.opacity(0.24))
                                    .frame(height: max(24, CGFloat(point.value / maxSpend) * 170))
                                Text(point.day)
                                    .font(.caption2)
                                    .foregroundStyle(AppTheme.secondaryText)
                            }
                        }
                    }
                    .frame(height: 220)
                }

                SectionCard {
                    Text("AI Insights")
                        .font(.headline)
                        .foregroundStyle(AppTheme.primaryText)

                    ForEach(SampleData.insights) { insight in
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: insight.icon)
                                .foregroundStyle(AppTheme.accent)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(insight.title)
                                    .font(.subheadline.bold())
                                    .foregroundStyle(AppTheme.primaryText)
                                Text(insight.summary)
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.secondaryText)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(AppTheme.background)
    }
}
