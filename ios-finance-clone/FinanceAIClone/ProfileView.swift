import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 84, height: 84)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                }

            Text("Kevin Zhao")
                .font(.title3.bold())
                .foregroundStyle(.white)

            Text("Operations Manager")
                .font(.subheadline)
                .foregroundStyle(.gray)

            VStack(spacing: 10) {
                profileItem("Security Center", "lock.shield")
                profileItem("Daily Transfer Limit", "slider.horizontal.3")
                profileItem("Notification Settings", "bell")
            }

            Spacer()
        }
        .padding(20)
        .background(AppTheme.background)
    }

    private func profileItem(_ title: String, _ icon: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.white)
            Text(title)
                .foregroundStyle(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(14)
        .background(Color.white.opacity(0.04), in: RoundedRectangle(cornerRadius: 12))
    }
}
