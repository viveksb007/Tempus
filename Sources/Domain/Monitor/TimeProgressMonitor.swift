import Foundation

@Observable
@MainActor
public final class TimeProgressMonitor {
    private let settingsProvider: @MainActor () -> (dateOfBirth: Date?, lifeExpectancy: Int)
    private let calendar = Calendar.current
    private var timer: Timer?

    public private(set) var progresses: [TimeProgress] = []
    public private(set) var lastUpdated: Date = Date()

    public init(settingsProvider: @MainActor @escaping () -> (dateOfBirth: Date?, lifeExpectancy: Int)) {
        self.settingsProvider = settingsProvider
        refresh()
        startAutoRefresh()
    }

    public func refresh() {
        let now = Date()
        lastUpdated = now

        progresses = [
            calculateMonthProgress(now),
            calculateYearProgress(now),
            calculateLifeProgress(now)
        ]
    }

    private func startAutoRefresh() {
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.refresh()
            }
        }
    }

    private func calculateMonthProgress(_ now: Date) -> TimeProgress {
        let dayOfMonth = calendar.component(.day, from: now)
        let daysInMonth = calendar.range(of: .day, in: .month, for: now)?.count ?? 30
        let percentage = (Double(dayOfMonth) / Double(daysInMonth)) * 100
        let remaining = daysInMonth - dayOfMonth

        return TimeProgress(
            type: .month,
            percentage: percentage,
            elapsed: "\(dayOfMonth) day\(dayOfMonth == 1 ? "" : "s")",
            remaining: "\(remaining) day\(remaining == 1 ? "" : "s")"
        )
    }

    private func calculateYearProgress(_ now: Date) -> TimeProgress {
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: now) ?? 1
        let daysInYear = calendar.range(of: .day, in: .year, for: now)?.count ?? 365
        let percentage = (Double(dayOfYear) / Double(daysInYear)) * 100
        let remaining = daysInYear - dayOfYear

        return TimeProgress(
            type: .year,
            percentage: percentage,
            elapsed: "\(dayOfYear) day\(dayOfYear == 1 ? "" : "s")",
            remaining: "\(remaining) day\(remaining == 1 ? "" : "s")"
        )
    }

    private func calculateLifeProgress(_ now: Date) -> TimeProgress {
        let settings = settingsProvider()

        guard let dateOfBirth = settings.dateOfBirth else {
            return TimeProgress(
                type: .life,
                percentage: 0,
                elapsed: "Set DOB",
                remaining: "in Settings"
            )
        }

        let lifeExpectancy = settings.lifeExpectancy
        let components = calendar.dateComponents([.day], from: dateOfBirth, to: now)
        let daysLived = components.day ?? 0
        let totalDays = Double(lifeExpectancy) * 365.25
        let percentage = (Double(daysLived) / totalDays) * 100

        let yearsLived = daysLived / 365
        let yearsRemaining = max(0, lifeExpectancy - yearsLived)

        return TimeProgress(
            type: .life,
            percentage: percentage,
            elapsed: "\(yearsLived) year\(yearsLived == 1 ? "" : "s")",
            remaining: "\(yearsRemaining) year\(yearsRemaining == 1 ? "" : "s")"
        )
    }

    public func stopAutoRefresh() {
        timer?.invalidate()
        timer = nil
    }
}
