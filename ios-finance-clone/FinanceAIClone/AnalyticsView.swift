import SwiftUI
import Charts

struct AnalyticsView: View {
    @State private var selectedTimePeriod: TimePeriod = .week

    enum TimePeriod: String, CaseIterable {
        case week = "Week"
        case month = "Month"
        case year = "Year"
    }

    var body: some View {
        VStack(spacing: 16) {
            Picker("Time Period", selection: $selectedTimePeriod) {
                ForEach(TimePeriod.allCases, id: \.self) { period in
                    Text(period.rawValue).tag(period)
                }
            }
            .pickerStyle(.segmented)

            Chart(SampleData.weeklySpend.indices, id: \.self) { idx in
                BarMark(
                    x: .value("Day", idx),
                    y: .value("Spend", SampleData.weeklySpend[idx])
                )
                .cornerRadius(3)
                .foregroundStyle(Color.blue.gradient)
            }
            .frame(height: 240)

            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}
