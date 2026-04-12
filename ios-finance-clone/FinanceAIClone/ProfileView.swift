import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(AppTheme.accent)

            Text(AppIdentity.shortName)
                .font(.title3.bold())
                .foregroundStyle(AppTheme.primaryText)

            Text(AppIdentity.longName)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundStyle(AppTheme.secondaryText)

            SectionCard {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Monthly Goal")
                            .font(.caption)
                            .foregroundStyle(AppTheme.secondaryText)
                        Text("$1,200 saved")
                            .font(.headline)
                            .foregroundStyle(AppTheme.primaryText)
                    }
                    Spacer()
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(AppTheme.accent)
                }
            }

            Spacer()
        }
        .padding()
        .background(AppTheme.background)
    }
}
