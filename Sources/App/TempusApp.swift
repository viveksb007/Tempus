import SwiftUI

@main
struct TempusApp: App {
    @State private var monitor: TimeProgressMonitor
    @State private var settings = AppSettings.shared

    init() {
        let settingsInstance = AppSettings.shared
        _monitor = State(initialValue: TimeProgressMonitor(settingsProvider: {
            (dateOfBirth: settingsInstance.dateOfBirth, lifeExpectancy: settingsInstance.lifeExpectancy)
        }))

        settingsInstance.onSettingsChanged = { [self] in
            Task { @MainActor in
                self.monitor.refresh()
            }
        }
    }

    var body: some Scene {
        MenuBarExtra {
            MenuContentView(monitor: monitor)
                .appThemeProvider(themeModeId: settings.themeMode)
        } label: {
            StatusBarIcon(progresses: monitor.progresses, displayTypes: settings.menuBarDisplayTypes)
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsView()
        }
    }
}
