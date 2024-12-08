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
