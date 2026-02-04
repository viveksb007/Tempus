import SwiftUI

struct MenuContentView: View {
    let monitor: TimeProgressMonitor
    @Environment(\.appTheme) private var theme
    @Environment(\.openSettings) private var openSettings

    private var currentDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return formatter.string(from: Date())
    }

    var body: some View {
        VStack(spacing: 16) {
            headerView

            VStack(spacing: 12) {
                ForEach(monitor.progresses) { progress in
                    ProgressCard(progress: progress)
                }
            }

            footerView
        }
        .padding(20)
        .frame(width: 320)
        .background(theme.backgroundColor)
    }

    private var headerView: some View {
        VStack(spacing: 4) {
            Text("Tempus")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(theme.primaryText)

            Text(currentDateString)
                .font(.caption)
                .foregroundStyle(theme.secondaryText)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 8)
    }

    private var footerView: some View {
        HStack {
            Button {
                openSettings()
            } label: {
                Label("Settings", systemImage: "gear")
                    .font(.caption)
            }
            .buttonStyle(.plain)
            .foregroundStyle(theme.secondaryText)

            Spacer()

            Button {
                NSApplication.shared.terminate(nil)
            } label: {
                Label("Quit", systemImage: "power")
                    .font(.caption)
            }
            .buttonStyle(.plain)
            .foregroundStyle(theme.secondaryText)
        }
        .padding(.top, 8)
    }
}
