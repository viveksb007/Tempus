import SwiftUI

struct StatusBarIcon: View {
    let progresses: [TimeProgress]
    let displayTypes: Set<String>

    private var displayText: String {
        let parts: [String] = ProgressType.allCases.compactMap { type in
            guard displayTypes.contains(type.rawValue),
                  let progress = progresses.first(where: { $0.type == type }),
                  progress.percentage > 0 else {
                return nil
            }

            let prefix: String
            switch type {
            case .month: prefix = "M"
            case .year: prefix = "Y"
            case .life: prefix = "L"
            }

            return String(format: "%@: %.0f%%", prefix, progress.percentage)
        }

        return parts.joined(separator: " ")
    }

    var body: some View {
        if displayText.isEmpty {
            Image(systemName: "hourglass")
        } else {
            Text(displayText)
                .font(.system(size: 12, weight: .medium, design: .monospaced))
        }
    }
}
