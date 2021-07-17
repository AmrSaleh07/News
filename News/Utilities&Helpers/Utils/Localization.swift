//
//  Localization.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

/// This class responsible of handling localization.
/// - Author: Amr Saleh.
/// - Date: Jun 17, 2021.
class Localization {
    
    static var bundle = Bundle.main
    
    /// Sets the desired language for the App.
    /// - Parameter LanguageIdentifier: language identifier etc, "en" , "ar".
    /// - Note: If this function is not called it will use the default OS language.
    /// - Author: Amr Saleh.
    /// - Date: Jun 17, 2021.
    static func setCurrentLanguage(to languageIdentifier: String) {
        UserDefaults.standard.set([languageIdentifier], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restart
        
        if let languageDirectoryPath = Bundle.main.path(forResource: languageIdentifier, ofType: "lproj") {
            bundle = Bundle(path: languageDirectoryPath)!
        } else {
            //Resets the localization system, so it uses the OS default language.
            bundle = Bundle.main
        }
    }
    
    /// Returns the current language for the App.
    /// - Returns: Language identifier for the current language.
    /// - Author: Amr Saleh.
    /// - Date: Jun 17, 2021.
    static func getCurrentLanguageIdentifier() -> String {
        guard let languages = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String] else {
            return AppLanguage.english.identifier()
        }
        return languages.first!
    }
    
    static var isCurrentLanguageEnglish: Bool {
        return Localization.getCurrentLanguageIdentifier() == AppLanguage.english.identifier()
    }
    
    static var isCurrentLanguageArabic: Bool {
        return Localization.getCurrentLanguageIdentifier() == AppLanguage.arabic.identifier()
    }
}
