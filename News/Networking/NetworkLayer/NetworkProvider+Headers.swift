//
//  NetworkProvider+Headers.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

extension NetworkProvider {
    
    /// Returns HTTP Headers fields for an API.
    ///
    /// - Parameter endpoint: EndPoint for an API.
    /// - Returns: HTTP Headers.
    class func headers(for endpoint:EndPoints) -> [String:String] {
        
        var defaultHeaders = ["Content-Type": "application/json", "Accept": "application/json"]

        return defaultHeaders
    }
}
