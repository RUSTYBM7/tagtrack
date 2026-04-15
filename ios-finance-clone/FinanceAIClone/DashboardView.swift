import SwiftUI

struct DashboardView: View {
    @State private var selectedTab: BankingTab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            background

            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    topHeader
                    balanceSection
                    cardsRow
                    actionsGrid
                    weeklyOverview
                    transactionSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 14)
                .padding(.bottom, 110)
            }

            bottomTabBar
                .padding(.horizontal, 18)
                .padding(.bottom, 14)
        }
    }

    private var background: some View {
        LinearGradient(
            colors: [Color(hex: "030816"), Color(hex: "0A1D4A"), Color(hex: "081230")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .overlay {
            RadialGradient(
                colors: [Color.blue.opacity(0.35), .clear],
                center: .topTrailing,
                startRadius: 10,
                endRadius: 450
            )
        }
        .ignoresSafeArea()
    }

    private var topHeader: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.white.opacity(0.15))
                .frame(width: 34, height: 34)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                }

            VStack(alignment: .leading, spacing: 3) {
                Text("Hello, James")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                Text("Your money is in motion")
                    .font(.system(size: 12))
                    .foregroundStyle(.white.opacity(0.65))
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "bell")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.white.opacity(0.08), in: Circle())
            }
        }
    }

    private var balanceSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Total balance")
                .font(.system(size: 13))
                .foregroundStyle(.white.opacity(0.7))

            Text("$8,600.30")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text("Cards")
                .font(.system(size: 13))
                .foregroundStyle(.white.opacity(0.7))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var cardsRow: some View {
        HStack(spacing: 12) {
            GlassCard(title: "Salary", amount: "$2,230", suffix: "• 6917", accent: Color(hex: "8EB9FF"))
            GlassCard(title: "Credit card", amount: "$5,230", suffix: "• 4433", accent: Color(hex: "6A8FF5"))
            GlassCard(title: "Travel", amount: "$985", suffix: "• 1794", accent: Color(hex: "A9BFFF"))
        }
        .frame(height: 132)
    }

    private var actionsGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 10) {
            ForEach(QuickAction.sample) { item in
                VStack(spacing: 9) {
                    Image(systemName: item.icon)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.white)
                    Text(item.title)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundStyle(.white.opacity(0.88))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .background(Color.white.opacity(0.07), in: RoundedRectangle(cornerRadius: 14))
                .overlay {
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.white.opacity(0.08), lineWidth: 1)
                }
            }
        }
    }

    private var weeklyOverview: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Weekly Overview")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                Spacer()
                Text("17 Apr – 23 Apr")
                    .font(.system(size: 11))
                    .foregroundStyle(.white.opacity(0.6))
            }

            HStack(alignment: .bottom, spacing: 11) {
                ForEach(Array(WeeklyPoint.points.enumerated()), id: \.offset) { _, point in
                    VStack(spacing: 6) {
                        Capsule()
                            .fill(point.highlight ? Color(hex: "B6FF5A") : Color.white.opacity(0.25))
                            .frame(width: 7, height: point.height)
                        Text(point.day)
                            .font(.system(size: 10))
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
            }
            .frame(maxWidth: .infinity)

            Text("30% your spending is lower compared to last month")
                .font(.system(size: 11))
                .foregroundStyle(.white.opacity(0.75))
        }
        .padding(14)
        .background(Color(hex: "101D44"), in: RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.08), lineWidth: 1)
        }
    }

    private var transactionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Last transactions")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color(hex: "7EA6FF"))
            }

            ForEach(Transaction.sample) { tx in
                HStack(spacing: 10) {
                    Circle()
                        .fill(.white.opacity(0.12))
                        .frame(width: 34, height: 34)
                        .overlay {
                            Image(systemName: tx.icon)
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                        }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(tx.title)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(.white)
                        Text(tx.subtitle)
                            .font(.system(size: 11))
                            .foregroundStyle(.white.opacity(0.58))
                    }

                    Spacer()

                    Text(tx.amount)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(tx.amount.hasPrefix("-") ? .white : Color(hex: "83EDAE"))
                }
                .padding(.vertical, 4)
            }
        }
        .padding(14)
        .background(Color(hex: "0F1A3A"), in: RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(.white.opacity(0.08), lineWidth: 1)
        }
    }

    private var bottomTabBar: some View {
        HStack(spacing: 10) {
            ForEach(BankingTab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 15, weight: .semibold))
                        Text(tab.title)
                            .font(.system(size: 10, weight: .medium))
                    }
                    .foregroundStyle(selectedTab == tab ? .white : .white.opacity(0.55))
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(
                        Group {
                            if selectedTab == tab {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color(hex: "304B9B"))
                            }
                        }
                    )
                }
            }
        }
        .padding(8)
        .background(Color(hex: "0A122D"), in: RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.1), lineWidth: 1)
        }
    }
}

private struct GlassCard: View {
    let title: String
    let amount: String
    let suffix: String
    let accent: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(
                LinearGradient(
                    colors: [accent.opacity(0.42), accent.opacity(0.16)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.white.opacity(0.22), lineWidth: 1)
            }
            .overlay(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 7) {
                    Text(title)
                        .font(.system(size: 11))
                        .foregroundStyle(.white.opacity(0.78))
                    Text(amount)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Spacer()
                    HStack {
                        Text(suffix)
                            .font(.system(size: 10))
                            .foregroundStyle(.white.opacity(0.7))
                        Spacer()
                        Text("VISA")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.85))
                    }
                }
                .padding(12)
            }
    }
}

private enum BankingTab: CaseIterable {
    case home
    case cards
    case transfers
    case more

    var title: String {
        switch self {
        case .home: return "Home"
        case .cards: return "Cards"
        case .transfers: return "Transfers"
        case .more: return "More"
        }
    }

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .cards: return "creditcard.fill"
        case .transfers: return "arrow.left.arrow.right"
        case .more: return "ellipsis"
        }
    }
}

private struct QuickAction: Identifiable {
    let id = UUID()
    let title: String
    let icon: String

    static let sample: [QuickAction] = [
        .init(title: "Bonuses", icon: "star.square.on.square"),
        .init(title: "Finance\nanalysis", icon: "chart.bar.xaxis"),
        .init(title: "Payments", icon: "list.bullet.rectangle"),
        .init(title: "Invest", icon: "chart.line.uptrend.xyaxis"),
        .init(title: "Budget", icon: "folder"),
        .init(title: "Savings", icon: "lock.shield"),
        .init(title: "Wallet", icon: "wallet.pass"),
        .init(title: "Rewards", icon: "gift")
    ]
}

private struct WeeklyPoint {
    let day: String
    let height: CGFloat
    let highlight: Bool

    static let points: [WeeklyPoint] = [
        .init(day: "M", height: 47, highlight: false),
        .init(day: "T", height: 28, highlight: true),
        .init(day: "W", height: 42, highlight: false),
        .init(day: "T", height: 23, highlight: false),
        .init(day: "F", height: 39, highlight: false),
        .init(day: "S", height: 44, highlight: true),
        .init(day: "S", height: 31, highlight: false)
    ]
}

private struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let amount: String
    let icon: String

    static let sample: [Transaction] = [
        .init(title: "Supermarket", subtitle: "Today, 16:40", amount: "-$40", icon: "cart"),
        .init(title: "Klark", subtitle: "Today, 12:30", amount: "+$12.30", icon: "person.crop.square"),
        .init(title: "Netflix", subtitle: "Yesterday", amount: "-$14.99", icon: "tv"),
        .init(title: "Salary", subtitle: "Apr 17", amount: "+$2,230", icon: "banknote")
    ]
}

private extension Color {
    init(hex: String) {
        let sanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: sanitized).scanHexInt64(&int)

        let r, g, b: UInt64
        switch sanitized.count {
        case 6:
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (255, 255, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}
