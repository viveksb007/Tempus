# Tempus

A macOS menu bar app that displays the progress of your Month, Year, and Life as percentages.

[![Build](https://github.com/viveksb007/Tempus/actions/workflows/build.yml/badge.svg)](https://github.com/viveksb007/Tempus/actions/workflows/build.yml)
![macOS](https://img.shields.io/badge/macOS-15.0%2B-blue)
![Swift](https://img.shields.io/badge/Swift-6.0-orange)

## Features

- **Month Progress** - Track how much of the current month has passed
- **Year Progress** - See your progress through the year
- **Life Progress** - Visualize your life's journey based on your date of birth and life expectancy
- **Animated Progress Bars** - Smooth animations when progress updates
- **Dark & Light Themes** - Choose your preferred appearance
- **Menu Bar Integration** - Shows life percentage directly in the menu bar

## Screenshots

The app appears in your menu bar showing your life progress percentage. Click to see detailed progress cards for Month, Year, and Life.

## Requirements

- macOS 15.0 or later
- Xcode 16.0 or later

## Installation

### Homebrew (Recommended)

```bash
brew tap viveksb007/tap
brew install --cask tempus
```

The app will be installed to `/Applications/Tempus.app`.

### Build from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/viveksb007/Tempus.git
   cd Tempus
   ```

2. Open the project in Xcode:
   ```bash
   open Tempus.xcodeproj
   ```

3. Build and run with `Cmd+R`

## Usage

1. After launching, Tempus appears in your menu bar
2. Click the menu bar icon to view progress cards
3. Open Settings (`Cmd+,`) to configure:
   - Date of Birth
   - Life Expectancy (default: 80 years)
   - Theme (Dark/Light)

## Architecture

The project follows a clean architecture pattern:

```
Sources/
├── Domain/           # Pure business logic
│   ├── Models/       # TimeProgress, ProgressType
│   ├── Monitor/      # TimeProgressMonitor
│   └── Repository/   # SettingsRepository protocol
├── Infrastructure/   # Technical implementations
│   └── Storage/      # UserDefaults implementation
└── App/              # SwiftUI layer
    ├── Settings/     # AppSettings
    ├── Theme/        # Theme system
    └── Views/        # UI components
```

## License

MIT License
