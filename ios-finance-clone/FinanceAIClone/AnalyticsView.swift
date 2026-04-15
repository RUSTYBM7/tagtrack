import SwiftUI
import Charts

struct AnalyticsView: View {
    private let weeklySeries: [DailyPoint] = [
        .init(day: "Mon", value: 820),
        .init(day: "Tue", value: 1260),
        .init(day: "Wed", value: 740),
        .init(day: "Thu", value: 1420),
        .init(day: "Fri", value: 960),
        .init(day: "Sat", value: 520),
        .init(day: "Sun", value: 680)
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Cashflow Overview")
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                Chart(weeklySeries) { point in
                    BarMark(
                        x: .value("Day", point.day),
                        y: .value("Amount", point.value)
                    )
                    .foregroundStyle(AppTheme.alert.gradient)
                    .cornerRadius(5)
                }
                .frame(height: 240)

                summaryRow(title: "Outgoing", value: "5,220.80 USD")
                summaryRow(title: "Incoming", value: "8,478.00 USD")
                summaryRow(title: "Net", value: "+3,257.20 USD")
            }
            .padding(20)
        }
        .background(AppTheme.background)
    }

    private func summaryRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.gray)
            Spacer()
            Text(value)
                .foregroundStyle(.white)
        }
        .padding(14)
        .background(Color.white.opacity(0.04), in: RoundedRectangle(cornerRadius: 12))
    }
}

struct DailyPoint: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
}
