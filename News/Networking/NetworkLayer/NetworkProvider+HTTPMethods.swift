//
//  NetworkProvider+HTTPMethods.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

extension NetworkProvider {
    
    /// Returns HTTP request method for an API.
    ///
    /// - Parameter endpoint: EndPoint for an API.
    /// - Returns: HTTP method.
    class func method(for endpoint:EndPoints) -> String {
        //For Example
        switch endpoint {
        default:
            return "GET"
        }
    }
}
