import SwiftUI

struct SectionCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            content
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.surface, in: RoundedRectangle(cornerRadius: 18))
    }
}

struct TagChip: View {
    let title: String
    let icon: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.caption.bold())
            Text(title)
                .font(.caption.weight(.semibold))
        }
        .foregroundStyle(AppTheme.primaryText)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(AppTheme.elevatedSurface, in: Capsule())
    }
}

struct ActionTile: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(AppTheme.accent)
            Text(title)
                .font(.subheadline.bold())
                .foregroundStyle(AppTheme.primaryText)
            Text(subtitle)
                .font(.caption)
                .foregroundStyle(AppTheme.secondaryText)
                .lineLimit(2)
        }
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
        .background(AppTheme.surface, in: RoundedRectangle(cornerRadius: 16))
    }
}
