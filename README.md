# NavigationManager

![Swift](https://img.shields.io/badge/Swift-5.7-orange)  ![Platforms](https://img.shields.io/badge/platforms-iOS%20|%20macOS%20|%20tvOS%20|%20watchOS-blue)  ![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-Compatible-green)  ![GitHub Stars](https://img.shields.io/github/stars/iamsagb/NavigationManager?style=social)  ![GitHub Forks](https://img.shields.io/github/forks/iamsagb/NavigationManager?style=social)  
![GitHub Contributors](https://img.shields.io/github/contributors/iamsagb/NavigationManager)  ![Pull Requests](https://img.shields.io/github/issues-pr/iamsagb/NavigationManager)  ![Issues](https://img.shields.io/github/issues/iamsagb/NavigationManager)  

---
# Description

**NavigationManager** is a lightweight, SwiftUI-friendly navigation library for managing navigation stacks.

•  Built on top of SwiftUI’s native **NavigationStack** and **NavigationDestination** APIs.

•  Simplifies navigation by eliminating the need for **NavigationLink** or **NavigationPath**.

•  Offers type-safe navigation, delivering better performance compared to type-erasing approaches.

•  Consolidates all navigation logic in a single, manageable location.

•  Enables flexible and dynamic control over navigation stacks.

•  Includes robust, unit-tested protocol implementations for reliability.

•  Designed with no external dependencies for seamless integration.

---

# Requirements - Minimum Platform Version

 - iOS  16.0 
 - macOS  13.0
 -  tvOS  16.0 
 - watchOS  9.0

---
# Installation

 
You can install **NavigationManager** using the **Swift Package Manager**.

1.  In Xcode, go to **File > Add Packages…**.
2.  Copy and paste the following URL into the “Search or Enter Package URL” field:
https://github.com/iamsagb/NavigationManager
3.  Add the package to your project.

---
# Getting Started

1. Create an `AppRoute` enum that lists the screens in your app. It should conform to the `Navigable` protocol: 


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

2. Integrate NavigationManager into your app:
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
func navigateBack(_ count: Int) // Go back by a specific number of steps.

func navigateBack(to destination: Destination) // Go back to a specific destination.

func navigateToRoot() // Return to the root view.

func navigate(to destination: Destination) // Navigate to a single destination.

func navigate(to destinations: [Destination]) // Navigate through a series of destinations.

func replace(with destinations: [Destination]) // Replace the stack with new destinations.
```

4. And That’s it! Check the Example App in the repo for more details and working examples.
