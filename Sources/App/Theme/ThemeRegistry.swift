import SwiftUI

@MainActor
public final class ThemeRegistry {
    public static let shared = ThemeRegistry()

    private var themes: [String: any AppTheme] = [:]

    private init() {
        register(DarkTheme())
        register(LightTheme())
    }

    public func register(_ theme: any AppTheme) {
        themes[theme.id] = theme
    }

    public func theme(for id: String) -> any AppTheme {
        themes[id] ?? DarkTheme()
    }

    public var availableThemes: [any AppTheme] {
        Array(themes.values)
    }
}
