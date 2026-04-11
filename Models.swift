// Define the AnalyticsData struct
struct AnalyticsData {
    var date: Date
    var spend: Double
}

// Extend SampleData with monthly and yearly spend arrays
struct SampleData {
    static let monthlySpend: [Double] = [100.0, 120.0, 90.0, 150.0, 110.0] // Example data
    static let yearlySpend: [Double] = [1200.0, 1400.0, 1500.0, 1600.0] // Example data

    // Data generation methods
    static func generateWeeklyChartData() -> [AnalyticsData] {
        // Generate weekly data and return it as an array
        var data: [AnalyticsData] = []
        for i in 0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: -i, to: Date())!
            let spend = Double.random(in: 50...200) // Example random spend
            data.append(AnalyticsData(date: date, spend: spend))
        }
        return data
    }

    static func generateMonthlyChartData() -> [AnalyticsData] {
        // Generate monthly data and return it as an array
        var data: [AnalyticsData] = []
        for i in 0..<12 {
            let date = Calendar.current.date(byAdding: .month, value: -i, to: Date())!
            let spend = monthlySpend[i % monthlySpend.count] // Use example spend
            data.append(AnalyticsData(date: date, spend: spend))
        }
        return data
    }

    static func generateYearlyChartData() -> [AnalyticsData] {
        // Generate yearly data and return it as an array
        var data: [AnalyticsData] = []
        for i in 0..<5 {
            let date = Calendar.current.date(byAdding: .year, value: -i, to: Date())!
            let spend = yearlySpend[i % yearlySpend.count] // Use example spend
            data.append(AnalyticsData(date: date, spend: spend))
        }
        return data
    }
}