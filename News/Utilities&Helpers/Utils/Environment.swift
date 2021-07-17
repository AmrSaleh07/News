//
//  Environment.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation

/// Add to this enum any keys exists in the .plist and you need to use their values in your code.
public enum PlistKey {
    case serverURL
    
    func value() -> String {
        switch self {
        case .serverURL:
            return "server_url"
        }
    }
}

public struct Environment {
    
    /// Get the .plist file
    var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }
    
    /// Returns the value for a specific key in the .plist.
    ///
    /// - Parameter key: .plist key.
    /// - Returns: value for the key.
    /// - Author: Amr Saleh.
    /// - Date: Dec 18, 2020.
    func configuration(_ key: PlistKey) -> String {
        switch key {
        case .serverURL:
            return infoDict[PlistKey.serverURL.value()] as! String
        }
    }
}

