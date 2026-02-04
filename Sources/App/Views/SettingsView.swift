import SwiftUI

struct SettingsView: View {
    @State private var settings = AppSettings.shared
    @State private var selectedTheme: String = AppSettings.shared.themeMode
    @State private var dateOfBirth: Date = AppSettings.shared.dateOfBirth ?? Calendar.current.date(byAdding: .year, value: -30, to: Date())!
    @State private var hasDateOfBirth: Bool = AppSettings.shared.dateOfBirth != nil
    @State private var lifeExpectancy: Int = AppSettings.shared.lifeExpectancy

    var body: some View {
        Form {
            Section("Life Progress") {
                Toggle("Set Date of Birth", isOn: $hasDateOfBirth)
                    .onChange(of: hasDateOfBirth) { _, newValue in
                        if newValue {
                            settings.dateOfBirth = dateOfBirth
                        } else {
                            settings.dateOfBirth = nil
                        }
                    }

                if hasDateOfBirth {
                    DatePicker(
                        "Date of Birth",
                        selection: $dateOfBirth,
                        in: ...Date(),
                        displayedComponents: .date
                    )
                    .onChange(of: dateOfBirth) { _, newValue in
                        settings.dateOfBirth = newValue
                    }
                }

                Stepper(value: $lifeExpectancy, in: 50...120) {
                    HStack {
                        Text("Life Expectancy")
                        Spacer()
                        Text("\(lifeExpectancy) years")
                            .foregroundStyle(.secondary)
                    }
                }
                .onChange(of: lifeExpectancy) { _, newValue in
                    settings.lifeExpectancy = newValue
                }
            }

            Section("Appearance") {
                Picker("Theme", selection: $selectedTheme) {
                    Text("Dark").tag("dark")
                    Text("Light").tag("light")
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedTheme) { _, newValue in
                    settings.themeMode = newValue
                }
            }

            Section("About") {
                LabeledContent("Version", value: "1.0.0")
                LabeledContent("Author", value: "viveksb.dev")
            }
        }
        .formStyle(.grouped)
        .frame(width: 400, height: 420)
    }
}

#Preview {
    SettingsView()
}
