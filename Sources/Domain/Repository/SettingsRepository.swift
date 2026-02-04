import Foundation

public protocol SettingsRepository: Sendable {
    var dateOfBirth: Date? { get }
    var lifeExpectancy: Int { get }
}
