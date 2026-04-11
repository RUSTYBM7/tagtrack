import SwiftUI

struct ExpenseCategory: Identifiable {
    let id = UUID()
    let name: String
    let spent: Double
    let budget: Double
    let color: Color

    var progress: Double { min(spent / budget, 1.0) }
    var remaining: Double { max(budget - spent, 0) }
}

struct WeeklySpendPoint: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
}

struct FinancialInsight: Identifiable {
    let id = UUID()
    let title: String
    let summary: String
    let icon: String
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let role: Role
    let text: String

    enum Role {
        case user
        case assistant
    }
}

enum SampleData {
    static let categories: [ExpenseCategory] = [
        .init(name: "Food & Dining", spent: 430, budget: 650, color: .orange),
        .init(name: "Transport", spent: 210, budget: 300, color: .blue),
        .init(name: "Shopping", spent: 560, budget: 700, color: .purple),
        .init(name: "Subscriptions", spent: 69, budget: 120, color: .pink)
    ]

    static let weeklySpend: [WeeklySpendPoint] = [
        .init(day: "Mon", value: 120),
        .init(day: "Tue", value: 85),
        .init(day: "Wed", value: 110),
        .init(day: "Thu", value: 140),
        .init(day: "Fri", value: 98),
        .init(day: "Sat", value: 165),
        .init(day: "Sun", value: 132)
    ]

    static let insights: [FinancialInsight] = [
        .init(title: "Savings", summary: "You saved 12% more than last month.", icon: "chart.line.uptrend.xyaxis"),
        .init(title: "Budget Risk", summary: "Shopping may exceed budget in 4 days.", icon: "exclamationmark.triangle"),
        .init(title: "Goal", summary: "Emergency fund is now at 78% progress.", icon: "target")
    ]

    static let starterMessages: [ChatMessage] = [
        .init(role: .assistant, text: "Your savings are up 12% compared to last month."),
        .init(role: .user, text: "How can I reduce dining expenses?"),
        .init(role: .assistant, text: "Set a weekly food cap of $130 and move 2 takeout meals to home-cooked options.")
    ]
}
