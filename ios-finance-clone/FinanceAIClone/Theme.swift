import SwiftUI

enum AppTheme {
    static let background = Color(red: 10 / 255, green: 14 / 255, blue: 24 / 255)
    static let surface = Color.white.opacity(0.06)
    static let elevatedSurface = Color.white.opacity(0.10)
    static let primaryText = Color.white
    static let secondaryText = Color.white.opacity(0.68)
    static let accent = Color(red: 102 / 255, green: 246 / 255, blue: 211 / 255)

    static let cardGradient = LinearGradient(
        colors: [
            Color(red: 96 / 255, green: 85 / 255, blue: 244 / 255),
            Color(red: 79 / 255, green: 172 / 255, blue: 254 / 255),
            Color(red: 0 / 255, green: 242 / 255, blue: 254 / 255)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
