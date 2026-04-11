import SwiftUI

struct ExpenseCategory: Identifiable {
    let id = UUID()
    let name: String
    let spent: Double
    let budget: Double
    let color: Color

    var progress: Double { min(spent / budget, 1.0) }
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

    static let weeklySpend: [Double] = [120, 85, 110, 140, 98, 165, 132]

    static let messages: [ChatMessage] = [
        .init(role: .assistant, text: "Your savings are up 12% compared to last month."),
        .init(role: .user, text: "How can I reduce dining expenses?"),
        .init(role: .assistant, text: "Set a weekly food cap of $130 and move 2 takeout meals to home-cooked options.")
    ]
}
