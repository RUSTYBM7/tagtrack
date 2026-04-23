import SwiftUI

struct AccountSummary: Identifiable {
    let id = UUID()
    let title: String
    let amount: String
    let delta: String
    let trendUp: Bool
}

struct QuickService: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}

struct TransactionItem: Identifiable {
    let id = UUID()
    let merchant: String
    let category: String
    let amount: String
    let timestamp: String
    let isDebit: Bool
}

enum SampleData {
    static let accounts: [AccountSummary] = [
        .init(title: "Total Assets", amount: "112,345.67 USD", delta: "+4.20%", trendUp: true),
        .init(title: "Available Balance", amount: "84,910.40 USD", delta: "+1.08%", trendUp: true)
    ]

    static let services: [QuickService] = [
        .init(title: "Transfer", icon: "arrow.left.arrow.right"),
        .init(title: "Payments", icon: "creditcard"),
        .init(title: "Cards", icon: "wallet.pass"),
        .init(title: "Invest", icon: "chart.xyaxis.line"),
        .init(title: "FX", icon: "dollarsign.circle")
    ]

    static let transactions: [TransactionItem] = [
        .init(merchant: "ICBC Credit Card", category: "Automatic Payment", amount: "-2,300.00", timestamp: "Today • 10:40", isDebit: true),
        .init(merchant: "Acme Logistics", category: "Incoming Transfer", amount: "+8,478.00", timestamp: "Today • 08:15", isDebit: false),
        .init(merchant: "Metro Retail", category: "POS Purchase", amount: "-126.80", timestamp: "Yesterday • 19:21", isDebit: true),
        .init(merchant: "Savings Pocket", category: "Scheduled Deposit", amount: "-700.00", timestamp: "Yesterday • 09:03", isDebit: true)
    ]
}
