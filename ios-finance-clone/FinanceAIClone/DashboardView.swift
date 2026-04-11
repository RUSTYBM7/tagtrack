import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    header
                    balanceCard
                    quickActions
                    spendingSection
                }
                .padding()
            }
            .background(Color.black)
            .navigationBarHidden(true)
        }
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello, Alex")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                Text("Your financial health looks strong")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            Spacer()

            Image(systemName: "bell.badge.fill")
                .font(.title3)
                .foregroundStyle(.mint)
                .padding(10)
                .background(Color.white.opacity(0.08), in: Circle())
        }
    }

    private var balanceCard: some View {
        RoundedRectangle(cornerRadius: 28)
            .fill(
                LinearGradient(
                    colors: [Color.mint.opacity(0.9), Color.blue.opacity(0.9)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(height: 210)
            .overlay(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Total Balance")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))

                    Text("$28,450.25")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    HStack(spacing: 20) {
                        metric("Income", "$8,350")
                        metric("Spent", "$4,125")
                    }
                }
                .padding(22)
            }
    }

    private func metric(_ title: String, _ value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
            Text(value)
                .font(.headline)
                .foregroundStyle(.white)
        }
    }

    private var quickActions: some View {
        HStack(spacing: 10) {
            actionChip("Send", "paperplane.fill")
            actionChip("Request", "arrow.down.left.circle.fill")
            actionChip("Top Up", "plus.circle.fill")
            actionChip("Insights", "sparkles")
        }
    }

    private func actionChip(_ title: String, _ icon: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(.mint)
            Text(title)
                .font(.caption)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 14))
    }

    private var spendingSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Spending by Category")
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                Text("This Month")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            ForEach(SampleData.categories) { category in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(category.name)
                            .foregroundStyle(.white)
                        Spacer()
                        Text("$\(Int(category.spent)) / $\(Int(category.budget))")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    ProgressView(value: category.progress)
                        .progressViewStyle(.linear)
                        .tint(category.color)
                        .background(Color.white.opacity(0.12))
                        .clipShape(Capsule())
                }
                .padding(12)
                .background(Color.white.opacity(0.04), in: RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}
