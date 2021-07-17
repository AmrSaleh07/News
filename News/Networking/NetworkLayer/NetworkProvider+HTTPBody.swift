//
//  NetworkProvider+HTTPBody.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

extension NetworkProvider {
    
    /// Returns the json data sent as the message body of a request, such as for HTTP POST request.
    ///
    /// - Parameter endpoint: EndPoint for an API
    /// - Returns: HTTP json body.
    class func httpBody(for endpoint: EndPoints) -> [String:Any]? {
        
        switch endpoint {
        default:
            return nil
        }
    }
}
