//
//  NetworkProvider+URLComponents.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation

extension NetworkProvider {

    /// Returns a constructed URL including it's query items for an API.
    ///
    /// - Parameter endpoint: EndPoint for an API.
    /// - Returns: URLComponents for an API.
    class func urlComponents(for endpoint: EndPoints) -> URLComponents {
        var components = URLComponents(string: serverURL + endpoint.value().addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)!
        
        switch endpoint {
        
        default:
            break
        }
        return components
    }
}
