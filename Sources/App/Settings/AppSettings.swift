import Foundation

@Observable
@MainActor
public final class AppSettings {
    public static let shared = AppSettings()

    private let defaults = UserDefaults.standard

    private enum Keys {
        static let themeMode = "tempus_theme_mode"
        static let dateOfBirth = "tempus_date_of_birth"
        static let lifeExpectancy = "tempus_life_expectancy"
    }

    public var themeMode: String {
        didSet { defaults.set(themeMode, forKey: Keys.themeMode) }
    }

    public var dateOfBirth: Date? {
        didSet {
            defaults.set(dateOfBirth, forKey: Keys.dateOfBirth)
            onSettingsChanged?()
        }
    }

    public var lifeExpectancy: Int {
        didSet {
            defaults.set(lifeExpectancy, forKey: Keys.lifeExpectancy)
            onSettingsChanged?()
        }
    }

    public var onSettingsChanged: (() -> Void)?

    private init() {
        themeMode = defaults.string(forKey: Keys.themeMode) ?? "dark"
        dateOfBirth = defaults.object(forKey: Keys.dateOfBirth) as? Date
        let storedExpectancy = defaults.integer(forKey: Keys.lifeExpectancy)
        lifeExpectancy = storedExpectancy > 0 ? storedExpectancy : 80
    }
}
