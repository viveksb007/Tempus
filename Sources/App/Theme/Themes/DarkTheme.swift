import SwiftUI

public struct DarkTheme: AppTheme {
    public let id = "dark"
    public let displayName = "Dark"

    public var backgroundColor: Color {
        Color(red: 0.1, green: 0.1, blue: 0.12)
    }

    public var cardBackground: Color {
        Color(red: 0.15, green: 0.15, blue: 0.18)
    }

    public var primaryText: Color {
        Color.white
    }

    public var secondaryText: Color {
        Color.gray
    }

    public var accentColor: Color {
        Color.blue
    }

    public var progressBarBackground: Color {
        Color(white: 0.25)
    }

    public var progressBarFill: Color {
        Color.blue
    }

    public func progressColor(for type: ProgressType) -> Color {
        switch type {
        case .month: return Color(red: 0.4, green: 0.6, blue: 1.0)
        case .year: return Color(red: 0.4, green: 0.9, blue: 0.6)
        case .life: return Color(red: 1.0, green: 0.4, blue: 0.6)
        }
    }

    public init() {}
}
