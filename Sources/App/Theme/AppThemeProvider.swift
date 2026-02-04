import SwiftUI

public protocol AppTheme: Sendable {
    var id: String { get }
    var displayName: String { get }

    // Colors
    var backgroundColor: Color { get }
    var cardBackground: Color { get }
    var primaryText: Color { get }
    var secondaryText: Color { get }
    var accentColor: Color { get }
    var progressBarBackground: Color { get }
    var progressBarFill: Color { get }

    // Progress type specific colors
    func progressColor(for type: ProgressType) -> Color
}

public extension AppTheme {
    func progressColor(for type: ProgressType) -> Color {
        switch type {
        case .month: return .blue
        case .year: return .green
        case .life: return .pink
        }
    }
}
