//
//  AppRoute.swift
//  Demo
//
//  Created by Sagar Bhosale on 11/11/24.
//


import SwiftUI
import NavigationManager

enum AppRoute: Navigable {
    case home
    case profile
    case settings

    var body: some View {
        switch self {
        case .home:
            ContentView()
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        }
    }
}


struct ProfileView: View {
    @EnvironmentObject var navigationManager: NavigationManager<AppRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile View")
                .font(.headline)

            Button("Go Back") {
                navigationManager.navigateBack(1)
            }
        }
        .padding()
        .navigationTitle("Profile")
    }
}

struct SettingsView: View {
    @EnvironmentObject var navigationManager: NavigationManager<AppRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings View")
                .font(.headline)

            Button("Go Back") {
                navigationManager.navigateBack(1)
            }

            Button("Return to Home") {
                navigationManager.navigateToRoot()
            }
        }
        .padding()
        .navigationTitle("Settings")
    }
}
