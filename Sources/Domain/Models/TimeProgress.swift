import Foundation

public struct TimeProgress: Identifiable, Sendable {
    public let id: ProgressType
    public let type: ProgressType
    public let percentage: Double
    public let elapsed: String
    public let remaining: String

    public var percentageFormatted: String {
        String(format: "%.1f%%", percentage)
    }

    public init(type: ProgressType, percentage: Double, elapsed: String, remaining: String) {
        self.id = type
        self.type = type
        self.percentage = min(max(percentage, 0), 100)
        self.elapsed = elapsed
        self.remaining = remaining
    }
}
