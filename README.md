# **NavigationManager**

**Description**

**NavigationManager** is a lightweight, SwiftUI-friendly navigation library for managing navigation stacks.

•  Built on top of SwiftUI’s native **NavigationStack** and **NavigationDestination** APIs.
•  Simplifies navigation by eliminating the need for **NavigationLink** or **NavigationPath**.
•  Offers type-safe navigation, delivering better performance compared to type-erasing approaches.
•  Consolidates all navigation logic in a single, manageable location.
•  Enables flexible and dynamic control over navigation stacks.
•  Includes robust, unit-tested protocol implementations for reliability.
•  Designed with no external dependencies for seamless integration.



**Requirements -** **Minimum Platform Version**

 - iOS  16.0 
 - macOS  13.0
 -  tvOS  16.0 
 - watchOS  9.0


**Installation**

 
You can install **NavigationManager** using the **Swift Package Manager**.

1.  In Xcode, go to **File > Add Packages…**.
2.  Copy and paste the following URL into the “Search or Enter Package URL” field:
https://github.com/iamsagb/NavigationManager
3.  Add the package to your project.


# Getting Started

1. Create an `AppRoute` enum that conforms to the `Navigable` protocol:


```
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
```

2. Set up your App to use the NavigationManager:
```
import NavigationManager
import SwiftUI

@main
struct DemoApp: App {
    @StateObject private var navigationManager = NavigationManager<AppRoute>()

    var body: some Scene {
        WindowGroup {
            NavigationStackView(stack: $navigationManager.stack) {
                HomeView()
            }
            .environmentObject(navigationManager)
        }
    }
}
```

3. Handle navigation using the NavigationManager functions from `NavigationManagingObject` Protocol

```
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
```

4. 
