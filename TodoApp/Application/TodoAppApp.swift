//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Afees Lawal on 04/08/2020.
//

import SwiftUI

@main
struct TodoAppApp: App {

    @State private var firsTimeLogin: Bool = UserDefaults.standard.bool(forKey: "firstTimeLogin")
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            if self.firsTimeLogin {
                MainView()
                    .environmentObject(themeManager)
                    .preferredColorScheme(themeManager.selectedTheme.colorScheme)
            } else {
                AnyView(OnboardingView(getStartedTapped: $firsTimeLogin))
                    .environmentObject(themeManager)
                    .preferredColorScheme(themeManager.selectedTheme.colorScheme)
            }
        }
    }
}
