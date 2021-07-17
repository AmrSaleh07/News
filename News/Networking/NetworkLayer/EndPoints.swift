//
//  EndPoints.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

/// This enum contains all endpoints for all APIs used in the App
enum EndPoints {
    
    // Authentication
    case allNews
    
    func value() -> String {
        switch self {
        case .allNews:
            return "/everything"
        }
    }
}

