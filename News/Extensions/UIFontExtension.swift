//
//  UIFontExtension.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit
import DeviceKit

/// Contains the names of the fonts used in the App.
enum AppFontType: String {
    case englishNormal = "ToyotaType-Book"
    case englishBold = "ToyotaType-Semibold"
    
    case arabicNormal = "arabicNormal"
    case arabicBold = "arabicBold"
}

/// Contains the states of the fonts used in the App.
enum AppFontState {
    case normal
    case bold
}

extension UIFont {
    
    /// Prints the name of all fonts available in the App.
    static func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        print("Available Fonts:")
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
    
    /// Returns an instance of UIFont with a specific name and size
    ///
    /// - Parameters:
    ///   - type: Font state (Normal, Bold, ...)
    ///   - size: Font size
    /// - Returns: An instance of UIFont
    /// - Author: Amr Saleh
    /// - Date: January 14, 2020
    static func getFont(type: AppFontState, size: CGFloat) -> UIFont {
        
        var fontType: AppFontType!
        switch type {
        case .normal:
            fontType = Localization.isCurrentLanguageEnglish ? .englishNormal : .arabicNormal
        case .bold:
            fontType = Localization.isCurrentLanguageEnglish ? .englishBold : .arabicBold
        }
        return getFontSize(name: fontType.rawValue, fontSize: size)
    }
    
    /// Returns an instance of UIFont with a specific name and size according to the current device.
    /// - Parameters:
    ///   - name: Font name.
    ///   - fontSize: Font size.
    /// - Returns: An instance of UIFont.
    /// - Author: Amr Saleh.
    /// - Date: January 14, 2020
    static func getFontSize(name: String, fontSize: CGFloat) -> UIFont {
    
        let device = Device.current
        
        if device.diagonal < 4.7 {
            return UIFont(name: name, size: fontSize - 2)!
        } else if device.diagonal >= 4.7, device.diagonal < 5.4 {
            return UIFont(name: name, size: fontSize)!
        } else if device.diagonal >= 5.4, device.diagonal < 6 {
            return UIFont(name: name, size: fontSize + 1)!
        } else {
            return UIFont(name: name, size: fontSize + 2)!
        }
    }
}
