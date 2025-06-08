import SwiftUI

final class ThemeManager: ObservableObject {
    enum Theme: String {
        case light
        case dark

        var colorScheme: ColorScheme {
            switch self {
            case .light: return .light
            case .dark: return .dark
            }
        }
    }

    @Published var selectedTheme: Theme {
        didSet { UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme") }
    }

    init() {
        let value = UserDefaults.standard.string(forKey: "selectedTheme") ?? Theme.dark.rawValue
        selectedTheme = Theme(rawValue: value) ?? .dark
    }

    func toggle() {
        selectedTheme = selectedTheme == .light ? .dark : .light
    }
}
