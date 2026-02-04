import Foundation

public enum ProgressType: String, CaseIterable, Identifiable, Sendable {
    case month
    case year
    case life

    public var id: String { rawValue }

    public var displayName: String {
        switch self {
        case .month: return "Month"
        case .year: return "Year"
        case .life: return "Life"
        }
    }

    public var icon: String {
        switch self {
        case .month: return "calendar"
        case .year: return "calendar.circle"
        case .life: return "heart.fill"
        }
    }
}
