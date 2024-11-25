//
//  NavigationManagingObject.swift
//
//  Created by Sagar Bhosale on 11/11/24.
//

import SwiftUI

/// `NavigationManagingObject` defines a protocol for objects that manage navigation within a SwiftUI application.
/// It specifies a set of navigation operations that enable type-safe routing between views identified by destinations conforming to the `Navigable` protocol.
/// Implementers of this protocol can control navigation stacks, allowing for forward and backward navigation, programmatically navigating to specific destinations, and modifying the navigation stack as needed.
///
/// Types implementing `NavigationManagingObject` can serve as the backbone of a navigation system, providing a consistent interface for navigating through an app's screens or views.
public protocol NavigationManagingObject: AnyObject {
    /// The type of the destination views in the navigation stack. Must conform to `Navigable`.
    associatedtype Destination: Navigable

    /// An array representing the current navigation stack of destinations.
    /// Modifying this stack updates the navigation state of the application.
    var stack: [Destination] { get set }

    /// Navigate back in the navigation stack by a specified number of destinations.
    ///
    /// - Parameter count: The number of destinations to navigate back by.
    /// If the count exceeds the number of destinations in the stack, the stack is emptied.
    func navigateBack(_ count: Int)

    /// Navigate back to a specific destination in the stack, removing all destinations that come after it.
    ///
    /// - Parameter destination: The destination to navigate back to.
    /// If the destination does not exist in the stack, no action is taken.
    func navigateBack(to destination: Destination)

    /// Resets the navigation stack to its initial state, effectively navigating to the root destination.
    func navigateToRoot()

    /// Appends a new destination to the navigation stack, moving forward in the navigation flow.
    ///
    /// - Parameter destination: The destination to navigate to.
    func navigate(to destination: Destination)

    /// Appends multiple new destinations to the navigation stack.
    ///
    /// - Parameter destinations: An array of destinations to append to the navigation stack.
    func navigate(to destinations: [Destination])

    /// Replaces the current navigation stack with a new set of destinations.
    ///
    /// - Parameter destinations: An array of new destinations to set as the navigation stack.
    func replace(with destinations: [Destination])
}

extension NavigationManagingObject {
    public func navigateBack(_ count: Int = 1) {
        guard count > 0 else { return }
        guard count <= stack.count else {
            stack = .init()
            return
        }
        stack.removeLast(count)
    }

    public func navigateBack(to destination: Destination) {
        if let index = stack.lastIndex(where: { $0 == destination }) {
            stack.truncate(to: index)
        }
    }

    public func navigateToRoot() {
        stack = []
    }

    public func navigate(to destination: Destination) {
        stack.append(destination)
    }

    public func navigate(to destinations: [Destination]) {
        stack += destinations
    }

    public func replace(with destinations: [Destination]) {
        stack = destinations
    }
}
