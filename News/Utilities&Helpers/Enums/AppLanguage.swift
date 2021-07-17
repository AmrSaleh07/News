//
//  AppLanguage.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

enum AppLanguage: Int, CaseIterable {
    
   case english
   case arabic

   func name() -> String {
       switch self {
       case .english:
           return "english".localized
       case .arabic:
           return "arabic".localized
       }
   }
   
   func identifier() -> String {
       switch self {
       case .english:
           return "en"
       case .arabic:
           return "ar"
       }
   }
   
   static func getLanguageWith(identifier: String) -> AppLanguage {
       var language: AppLanguage!
       for item in AppLanguage.allCases where item.identifier() == identifier {
           language = item
       }
       return language
   }
}
