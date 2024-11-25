//
//  DemoApp.swift
//  Demo
//
//  Created by Sagar Bhosale on 11/11/24.
//

import NavigationManager
import SwiftUI

@main
struct DemoApp: App {
    @StateObject private var navigationManager = NavigationManager<AppRoute>()

    var body: some Scene {
        WindowGroup {
            NavigationStackView(stack: $navigationManager.stack) {
                ContentView()
            }
            .environmentObject(navigationManager)
        }
    }
}
