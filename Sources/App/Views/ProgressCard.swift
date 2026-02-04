import SwiftUI

struct ProgressCard: View {
    let progress: TimeProgress
    @Environment(\.appTheme) private var theme

    @State private var animatedProgress: Double = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: progress.type.icon)
                    .font(.title2)
                    .foregroundStyle(theme.progressColor(for: progress.type))

                Text(progress.type.displayName)
                    .font(.headline)
                    .foregroundStyle(theme.primaryText)

                Spacer()

                Text(progress.percentageFormatted)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundStyle(theme.progressColor(for: progress.type))
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(theme.progressBarBackground)
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                colors: [
                                    theme.progressColor(for: progress.type),
                                    theme.progressColor(for: progress.type).opacity(0.7)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geometry.size.width * (animatedProgress / 100), height: 8)
                }
            }
            .frame(height: 8)

            HStack {
                Label(progress.elapsed, systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(theme.secondaryText)

                Spacer()

                Label(progress.remaining, systemImage: "clock.badge.questionmark")
                    .font(.caption)
                    .foregroundStyle(theme.secondaryText)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.cardBackground)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                animatedProgress = progress.percentage
            }
        }
        .onChange(of: progress.percentage) { _, newValue in
            withAnimation(.easeOut(duration: 0.5)) {
                animatedProgress = newValue
            }
        }
    }
}
