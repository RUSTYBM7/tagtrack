import SwiftUI
import Charts

struct AnalyticsView: View {
    @State private var data: [AnalyticsData] = []
    @State private var selectedTimePeriod: TimePeriod = .week
    @State private var isLoading: Bool = false

    enum TimePeriod: String, CaseIterable {
        case week = "Week"
        case month = "Month"
        case year = "Year"
    }

    var body: some View {
        VStack {
            Picker("Select Time Period", selection: $selectedTimePeriod) {
                ForEach(TimePeriod.allCases, id: \ .self) { period in
                    Text(period.rawValue).tag(period)
                }
            }.pickerStyle(SegmentedPickerStyle())

            if isLoading {
                ProgressView()
            } else {
                // Chart for Analytics Data
                Chart(data) { analytics in
                    BarMark(x: .value("Date", analytics.date), y: .value("Spend", analytics.spend))
                }
                .frame(height: 300)

                // Statistics Cards
                HStack {
                    StatisticsCard(title: "Total Spend", value: "\(totalSpend())")
                    StatisticsCard(title: "Average Spend", value: "\(averageSpend())")
                    StatisticsCard(title: "Peak Spend", value: "\(peakSpend())")
                }

                Button(action: exportData) {
                    Text("Export Data")
                }
            }
        }
        .onAppear(perform: loadData)
        .refreshable { loadData() }
    }

    private func loadData() {
        isLoading = true
        // Load your data from an API or local source based on the selectedTimePeriod
        isLoading = false
    }

    private func exportData() {
        // Implement export logic here for CSV and JSON formats
    }

    private func totalSpend() -> Double {
        data.reduce(0) { $0 + $1.spend }
    }

    private func averageSpend() -> Double {
        let total = totalSpend()
        return total / Double(data.count)
    }

    private func peakSpend() -> Double {
        data.map { $0.spend }.max() ?? 0
    }
}

struct StatisticsCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
            Text(value)
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct AnalyticsData {
    let date: Date
    let spend: Double
}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            AnalyticsView()
        }
    }
}