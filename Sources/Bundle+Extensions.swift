//
//  File.swift
//  
//
//  Created by Leo Tsuchiya on 6/6/21.
//

import Foundation

private class BundleFinder {}

extension Foundation.Bundle {
    static var module: Bundle = {
        let bundleName = "LifetimeTrackerResources"
        let rootBundle = Bundle(for: BundleFinder.self)

        guard let resourcesPath = rootBundle.path(forResource: bundleName, ofType: "bundle"),
              let resourcesBundle = Bundle(path: resourcesPath)
        else { preconditionFailure("Unable to find bundle named LifetimeTrackerResources") }

        return resourcesBundle
    }()
}

// MARK: - Objective-C Bundle Accessor

@objc
class LifetimeTrackerResources: NSObject {
    @objc class var bundle: Bundle {
        return .module
    }
}

extension Bundle {
    static var resolvedBundle: Bundle {
        LifetimeTrackerResources.bundle
    }
}
