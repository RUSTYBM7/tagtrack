import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    header
                    accountCards
                    quickServices
                    transactions
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 28)
            }
            .background(AppTheme.background)
            .navigationBarHidden(true)
        }
    }

    private var header: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("ICBC")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text("Enterprise Banking")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            Spacer()

            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 44, height: 44)
                Image(systemName: "bell")
                    .foregroundStyle(.white)
            }
        }
    }

    private var accountCards: some View {
        VStack(spacing: 12) {
            ForEach(SampleData.accounts) { item in
                RoundedRectangle(cornerRadius: 24)
                    .fill(AppTheme.card)
                    .overlay {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.title)
                                .font(.subheadline)
                                .foregroundStyle(.gray)

                            Text(item.amount)
                                .font(.system(size: 30, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)

                            HStack(spacing: 6) {
                                Image(systemName: item.trendUp ? "arrow.up.right" : "arrow.down.right")
                                    .font(.caption.bold())
                                Text(item.delta)
                                    .font(.caption.bold())
                            }
                            .foregroundStyle(item.trendUp ? .green : AppTheme.alert)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                    }
                    .frame(height: 160)
            }
        }
    }

    private var quickServices: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Services")
                .font(.headline)
                .foregroundStyle(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(SampleData.services) { service in
                        VStack(spacing: 10) {
                            Image(systemName: service.icon)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(service.title)
                                .font(.caption)
                                .foregroundStyle(.white)
                                .lineLimit(1)
                        }
                        .frame(width: 86, height: 86)
                        .background(Color.white.opacity(0.05), in: RoundedRectangle(cornerRadius: 16))
                    }
                }
            }
        }
    }

    private var transactions: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Recent Transactions")
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                Text("View all")
                    .font(.caption)
                    .foregroundStyle(AppTheme.alert)
            }

            ForEach(SampleData.transactions) { item in
                HStack(spacing: 12) {
                    Circle()
                        .fill(Color.white.opacity(0.08))
                        .frame(width: 42, height: 42)
                        .overlay {
                            Image(systemName: item.isDebit ? "arrow.up.right" : "arrow.down.left")
                                .foregroundStyle(item.isDebit ? AppTheme.alert : .green)
                        }

                    VStack(alignment: .leading, spacing: 3) {
                        Text(item.merchant)
                            .foregroundStyle(.white)
                        Text(item.category)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 3) {
                        Text(item.amount)
                            .foregroundStyle(item.isDebit ? AppTheme.alert : .white)
                            .fontWeight(.medium)
                        Text(item.timestamp)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(12)
                .background(Color.white.opacity(0.04), in: RoundedRectangle(cornerRadius: 14))
            }
        }
    }
}

enum AppTheme {
    static let background = Color(red: 0.03, green: 0.03, blue: 0.04)
    static let card = LinearGradient(
        colors: [Color(red: 0.09, green: 0.09, blue: 0.10), Color(red: 0.04, green: 0.04, blue: 0.05)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let alert = Color(red: 0.85, green: 0.20, blue: 0.24)
}
