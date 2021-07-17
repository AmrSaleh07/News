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
        components.queryItems = [URLQueryItem(name: "apiKey", value: Constants.newsApiKey)]
        switch endpoint {
        case .allNews(let page, let searchTerm):
            components.queryItems!.append(URLQueryItem(name: "page", value: String(page)))
            components.queryItems!.append(URLQueryItem(name: "pageSize", value: Constants.perPage))
            if searchTerm != nil {
                components.queryItems!.append(URLQueryItem(name: "q", value: searchTerm))
            }
            return components
        }
    }
}
