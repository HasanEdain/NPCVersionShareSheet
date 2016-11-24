# NPCVersionShareSheet
A simple framework for showing a UIViewController With all of the Dynamic Frameworks in the containing application.

# Sample Application
![Main Screen](/ScreenShots/Main.png "Main Screen")
![All Frameworks](/ScreenShots/AllFrameworks.png "All Frameworks")
![Search](/ScreenShots/Search.png "Search")
![Share Sheet](/ScreenShots/ShareSheet.png "Share")

# Install
Example Application: Run in Xcode 8 +

Framework:
## Build yourself
Copy the framework into your project
## Carthage
Create Cartfile with depenency
<code>
NPCVersionShareSheet
</code>

Use [Carthage](https://github.com/Carthage/Carthage) instructions for adding library dependency.

# API
Instantiate and display a <code>NPCVersionShareSheetViewController</code>
Convenience

    /// Convenience Wrapper around Bundle allFrameworks
    /// Returns ONLY bundles with Bundle Identifiers
    public static func allBundles() -> [Bundle]

    /// All bundles that do not contain com.apple
    public static func allNonAppleBundles() -> [Bundle]

    /// Filter a list of Bundles with a string (compares to the bundle identifier)
    /// @return [Bundle]
    public static func filterBundleList(bundleList: [Bundle], filterString: String) -> [Bundle]

    /// A string rendering of each Bundle in the array
    /// @return String
    public static func bundleListString(bundleList: [Bundle]) -> String

    /// A string representation of a Bundle
    public static func bundleString(bundle: Bundle) -> String
