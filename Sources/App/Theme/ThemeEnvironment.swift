import SwiftUI

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: any AppTheme = DarkTheme()
}

extension EnvironmentValues {
    var appTheme: any AppTheme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

extension View {
    func appTheme(_ theme: any AppTheme) -> some View {
        environment(\.appTheme, theme)
    }

    @MainActor
    func appThemeProvider(themeModeId: String) -> some View {
        let theme = ThemeRegistry.shared.theme(for: themeModeId)
        return self.environment(\.appTheme, theme)
    }
}
