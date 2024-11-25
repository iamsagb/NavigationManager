//
//  ContentView.swift
//  NavigationManager-Demo
//
//  Created by MBP-14 on 25/11/24.
//


import SwiftUI
import NavigationManager

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager<AppRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to the Navigation Manager Demo")
                .font(.headline)

            Button("Go to Profile") {
                navigationManager.navigate(to: .profile)
            }

            Button("Go to Settings") {
                navigationManager.navigateToRoot()
            }
        }
        .padding()
        .navigationTitle("Home")
    }
}
