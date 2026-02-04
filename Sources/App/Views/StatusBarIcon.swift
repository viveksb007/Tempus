import SwiftUI

struct StatusBarIcon: View {
    let lifePercentage: Double?

    var body: some View {
        if let percentage = lifePercentage, percentage > 0 {
            Text(String(format: "%.0f%%", percentage))
                .font(.system(size: 12, weight: .medium, design: .monospaced))
        } else {
            Image(systemName: "hourglass")
        }
    }
}
