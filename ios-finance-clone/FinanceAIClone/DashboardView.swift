import SwiftUI

struct DashboardView: View {
    var totalSpent: Double { SampleData.categories.reduce(0) { $0 + $1.spent } }
    var totalBudget: Double { SampleData.categories.reduce(0) { $0 + $1.budget } }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    header
                    balanceCard
                    insightChips
                    quickActionSection
                    spendingSection
                }
                .padding()
            }
            .background(AppTheme.background)
            .navigationBarHidden(true)
        }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome to \(AppIdentity.shortName)")
                    .font(.title2.bold())
                    .foregroundStyle(AppTheme.primaryText)
                Text("Built for integration and efficiency at scale")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.secondaryText)
            }

            Spacer()

            Image(systemName: "bell.badge.fill")
                .foregroundStyle(AppTheme.accent)
                .padding(10)
                .background(AppTheme.surface, in: Circle())
        }
    }

    private var balanceCard: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(AppTheme.cardGradient)
            .frame(height: 220)
            .overlay {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Total Balance")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))

                    Text("$28,450.25")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    HStack(spacing: 20) {
                        metric("Income", "$8,350")
                        metric("Spent", "$\(Int(totalSpent))")
                        metric("Budget", "$\(Int(totalBudget))")
                    }
                }
                .padding(22)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
    }

    private func metric(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.75))
            Text(value)
                .font(.headline)
                .foregroundStyle(.white)
        }
    }

    private var insightChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                TagChip(title: "AI Insights", icon: "sparkles")
                TagChip(title: "Budget On Track", icon: "checkmark.seal")
                TagChip(title: "Goal Progress", icon: "target")
            }
        }
    }

    private var quickActionSection: some View {
        HStack(spacing: 10) {
            ActionTile(title: "Transfer", subtitle: "Send money instantly", icon: "paperplane.fill")
            ActionTile(title: "Ask AI", subtitle: "Get smart finance tips", icon: "wand.and.stars")
            ActionTile(title: "Set Budget", subtitle: "Limit category spending", icon: "slider.horizontal.3")
        }
    }

    private var spendingSection: some View {
        SectionCard {
            HStack {
                Text("Spending by Category")
                    .font(.headline)
                    .foregroundStyle(AppTheme.primaryText)
                Spacer()
                Text("This Month")
                    .font(.caption)
                    .foregroundStyle(AppTheme.secondaryText)
            }

            ForEach(SampleData.categories) { category in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(category.name)
                            .foregroundStyle(AppTheme.primaryText)
                        Spacer()
                        Text("$\(Int(category.spent)) / $\(Int(category.budget))")
                            .font(.caption)
                            .foregroundStyle(AppTheme.secondaryText)
                    }

                    ProgressView(value: category.progress)
                        .tint(category.color)
                        .background(Color.white.opacity(0.08))
                        .clipShape(Capsule())

                    Text("$\(Int(category.remaining)) left")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.secondaryText)
                }
                .padding(10)
                .background(Color.white.opacity(0.03), in: RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
