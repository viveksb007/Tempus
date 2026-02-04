import SwiftUI

public struct LightTheme: AppTheme {
    public let id = "light"
    public let displayName = "Light"

    public var backgroundColor: Color {
        Color(red: 0.95, green: 0.95, blue: 0.97)
    }

    public var cardBackground: Color {
        Color.white
    }

    public var primaryText: Color {
        Color.black
    }

    public var secondaryText: Color {
        Color(red: 0.4, green: 0.4, blue: 0.45)
    }

    public var accentColor: Color {
        Color.blue
    }

    public var progressBarBackground: Color {
        Color(white: 0.85)
    }

    public var progressBarFill: Color {
        Color.blue
    }

    public func progressColor(for type: ProgressType) -> Color {
        switch type {
        case .month: return Color(red: 0.2, green: 0.4, blue: 0.9)
        case .year: return Color(red: 0.2, green: 0.7, blue: 0.4)
        case .life: return Color(red: 0.9, green: 0.3, blue: 0.5)
        }
    }

    public init() {}
}
