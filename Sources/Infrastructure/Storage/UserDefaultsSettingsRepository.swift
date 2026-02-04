import Foundation

public final class UserDefaultsSettingsRepository: SettingsRepository, @unchecked Sendable {
    public static let shared = UserDefaultsSettingsRepository()

    private let defaults = UserDefaults.standard

    private enum Keys {
        static let dateOfBirth = "tempus_date_of_birth"
        static let lifeExpectancy = "tempus_life_expectancy"
    }

    public var dateOfBirth: Date? {
        get { defaults.object(forKey: Keys.dateOfBirth) as? Date }
        set { defaults.set(newValue, forKey: Keys.dateOfBirth) }
    }

    public var lifeExpectancy: Int {
        get {
            let value = defaults.integer(forKey: Keys.lifeExpectancy)
            return value > 0 ? value : 80
        }
        set { defaults.set(newValue, forKey: Keys.lifeExpectancy) }
    }

    private init() {}
}
