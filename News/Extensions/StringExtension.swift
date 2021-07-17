//
//  StringExtension.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation
import UIKit

extension String {
    
    /// Returns the a localized string according to the current language.
    var localized: String {
        return Localization.bundle.localizedString(forKey: self, value: self, table: nil)
    }
}
