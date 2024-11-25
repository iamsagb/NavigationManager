//
//  NavigationStackView.swift
//
//  Created by Sagar Bhosale on 11/11/24.
//

import SwiftUI

/// `NavigationStackView` is a generic structure that provides a navigation mechanism for SwiftUI views.
/// It uses a navigation stack to manage routing between different views based on the provided `Routes` enum.
///
/// This structure is generic over two types: `Root` and `Routes`. `Root` is the type of the initial view to be displayed, and `Routes`
/// is an enumeration that conforms to the `Navigable` protocol, defining possible navigation paths in the application.
///
/// - Parameters:
///   - stack: A binding to an array of `Routes` that represents the current navigation stack. Changes to this array will update the navigation state.
///   - root: A closure that returns the root view (`Root`) of the navigation stack. This view is presented initially when the `NavigationStackView` is rendered.
///
/// The `NavigationStackView` uses a `NavigationStack` to manage its navigation stack, with the path being driven by the `routes` binding.
/// It leverages SwiftUI's `navigationDestination(for:destination:)` modifier to map each route to its corresponding view.
///
/// Example Usage:
/// ```
/// struct ContentView: View {
///     @State private var navigationManager: NavigationManager<MyRoutes> = .init()
///
///     var body: some View {
///         NavigationStackView(stack: $navigationManager.stack) {
///             MyRootView()
///         }
///     }
/// }
/// ```
///
/// - Note: Ensure that the `Routes` enum conforms to the `Navigable` protocol and that each route properly defines its associated view.
public struct NavigationStackView<Root: View, Routes: Navigable>: View {
    @Binding private var routes: [Routes]
    private let root: () -> Root

    /// Initializes a new instance of `NavigationStackView` with the specified navigation stack and root view.
    ///
    /// - Parameters:
    ///   - stack: A binding to an array of `Routes` indicating the current navigation stack.
    ///   - root: A closure that returns the root view of the navigation stack.
    public init(
        stack: Binding<[Routes]>,
        @ViewBuilder root: @escaping () -> Root
    ) where Routes: Navigable {
        self._routes = stack
        self.root = root
    }

    /// The body of the `NavigationStackView`. This view contains the navigation logic and view mapping based on the current state of the `routes` array.
    ///
    /// It uses a `NavigationStack` to present the root view and navigates to other views based on the `Routes` enum.
    public var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $routes) {
                root()
                    .navigationDestination(for: Routes.self) { view in
                        view
                    }
            }
        }
    }
}
