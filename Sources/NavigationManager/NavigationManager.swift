//
//  NavigationManager.swift
//
//  Created by Sagar Bhosale on 11/11/24.
//

import SwiftUI

/// `NavigationManager` is a final class that acts as the navigation manager within a SwiftUI application, leveraging the `NavigationManagingObject` protocol to handle navigation through a stack of navigable destinations.
/// It is specifically designed to work in conjunction with `RoutingView` to facilitate dynamic and type-safe navigation between views defined by the `Routes` enum.
///
/// Now conforming to `ObservableObject` and using the `@Published` property wrapper, `NavigationManager` ensures that any modifications to the navigation stack prompt automatic UI updates.
/// This enhancement is pivotal for creating responsive and state-aware navigation flows in SwiftUI applications, aligning with SwiftUI's data-driven architecture.
///
/// The class is generic over a `Routes` parameter, which must conform to the `Navigable` protocol.
/// This design guarantees that the navigation stack consists solely of valid, predefined routes, enhancing the robustness and maintainability of the navigation logic.
///
/// Usage Example:
/// ```
/// @StateObject private var navigationManager: NavigationManager<MyRoutes> = .init()
///
/// var body: some View {
///     RoutingView(stack: $navigationManager.stack) {
///         MyRootView()
///     }
/// }
/// ```
///
/// In this example, `RoutingView` utilizes a `NavigationManager` instance to manage its navigation stack dynamically.
/// This setup allows for seamless navigation between the different views represented by the `MyRoutes` enum, with `NavigationManager` facilitating the navigation state management.
///
/// Properties:
/// - `stack`: A mutable array of `Routes` that signifies the current navigation stack.
/// Observing this property within SwiftUI views triggers re-renders upon its modification, enabled by the `@Published` property wrapper for dynamic and reactive navigation experiences.
///
/// Initialization:
/// - `init()`: Instantiates a `NavigationManager` with an initially empty navigation stack.
/// This base state is ready to be populated with navigable destinations as dictated by the application's navigation requirements.
///
/// Conformance to `NavigationManagingObject`:
/// - `NavigationManager` adheres to the `NavigationManagingObject` protocol, implementing essential navigation operations such as navigating backwards, navigating to specific destinations, and managing the navigation stack.
/// These capabilities are crucial for realizing complex navigation structures in a declarative, SwiftUI-compatible manner.
public final class NavigationManager<Routes: Navigable>: NavigationManagingObject, ObservableObject {
    public typealias Destination = Routes

    @Published public var stack: [Routes] = []

    public init() {}
}
