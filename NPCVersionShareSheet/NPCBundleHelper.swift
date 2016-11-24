//
//  NPCBundleHelper.swift
//  NPCVersionShareSheet
//
//  Created by Hasan D Edain on 11/23/16.
//  Copyright © 2016 NPC Unlimited. All rights reserved.
//

import Foundation

public class NPCBundleHelper {

    /// Convenience Wrapper around Bundle allFrameworks
    /// Returns ONLY bundles with Bundle Identifiers
    public static func allBundles() -> [Bundle] {
        let all = Bundle.allFrameworks
        var allWithBundles = [Bundle]()

        for bundle in all {
            if bundle.bundleIdentifier != nil {
                allWithBundles.append(bundle)
            }
        }

        return allWithBundles
    }

    /// All bundles that do not contain com.apple
    public static func allNonAppleBundles() -> [Bundle] {
        let all = NPCBundleHelper.allBundles()
        var nonApple = [Bundle]()
        for bundle in all {
            if let identifier = bundle.bundleIdentifier {
                if identifier.contains("com.apple") != true {
                    nonApple.append(bundle)
                }
            }
        }

        return nonApple
    }

    // Filter

    /// Filter a list of Bundles with a string (compares to the bundle identifier)
    /// @return [Bundle]
    public static func filterBundleList(bundleList: [Bundle], filterString: String) -> [Bundle] {
        var filteredBundles = [Bundle]()

        for bundle in bundleList {
            if let bunldeIdentifier = bundle.bundleIdentifier {
                let lcBundleId = bunldeIdentifier.lowercased()
                let lcFilterString = filterString.lowercased()
                if lcBundleId.contains(lcFilterString) {
                    filteredBundles.append(bundle)
                }
            }
        }

        return filteredBundles
    }

    // Text

    /// A string rendering of each Bundle in the array
    /// @return String
    public static func bundleListString(bundleList: [Bundle]) -> String {
        var bundlesString = ""
        for bundle in bundleList {
            let bundleString = NPCBundleHelper.bundleString(bundle: bundle)
            bundlesString.append(bundleString)
        }

        return bundlesString
    }

    /// A string representation of a Bundle
    public static func bundleString(bundle: Bundle) -> String {
        var bundleIdentifierString: String
        if let bndleIdentifierString = bundle.bundleIdentifier {
            bundleIdentifierString = bndleIdentifierString
        } else {
            bundleIdentifierString = ""
        }
        var versionString: String

        if let shortVersionString = (bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")) as? String {
            versionString = shortVersionString

            if let cfVersionString = (bundle.object(forInfoDictionaryKey: "CFBundleVersion")) as? String {
                versionString = "\(shortVersionString) (\(cfVersionString))"
            }
        } else {
            versionString = ""
        }

        var nameString: String
        if let cfNameString = (bundle.object(forInfoDictionaryKey: "CFBundleName")) as? String {
            nameString = cfNameString
        } else {
            nameString = ""
        }

        let bndlString = "\n\(nameString)\n\(versionString)\n\(bundleIdentifierString)\n-----------"

        return bndlString
    }

}
