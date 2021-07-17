//
//  NetworkProvider.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation
import Gloss

/// Responsible for creating API requests
class NetworkProvider {
    
    /// Creates a 'dataTask' request to retrieve the contents of a URL
    /// based on specified url, parameters, HTTP method and headers.
    ///
    /// - Parameters:
    ///   - endpoint: Endpoint for the requested API.
    ///   - responseType: Model type for parsing the response json.
    ///   - completion: A closure to be executed once the request has finished,
    ///     containing the data and error type if exist.
    /// - Author: Amr Saleh.
    /// - Date: January 19, 2020.
    class func request<DataType:Glossy>(for endpoint: EndPoints, responseType:DataType.Type, completion: @escaping (_ error:APIRequestError?, _ data:DataType?, _ validationError:[String:[String]]?) -> Void) {

        ///Check if url is in invalid format
        guard let url = urlComponents(for: endpoint).url else {
            print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
            print("""
                🔷 EndPoint: \(endpoint.value())
                🔷 URL: \(String(describing: urlComponents(for: endpoint).url))
                ❌ Error: \(APIRequestError.invalidURL)
                """)
            print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
            completion(APIRequestError.invalidURL, nil, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method(for: endpoint)
        
        ///Set HttpBody
        if let httpBody = httpBody(for: endpoint) {
            do {
                let httpBody = try JSONSerialization.data(withJSONObject: httpBody, options: [])
                request.httpBody = httpBody
            } catch {}
        }
        
        ///Set Headers
        for (key, value) in headers(for: endpoint) {
            request.setValue(value, forHTTPHeaderField: key)
        }
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
            print("""
                🔷 EndPoint: \(endpoint.value())
                🔷 URL: \(url)
                🔷 Method: \(method(for: endpoint))
                🔷 HTTPBody: \(String(describing: httpBody(for: endpoint)))
                🔷 Headers: \(headers(for: endpoint))
                """)
            
            ///Check for client error
            if error != nil {
                print("❌ Error: \(APIRequestError.clientError(description: error!.localizedDescription).localizedDescription)")
                print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
                completion(APIRequestError.clientError(description: error!.localizedDescription), nil, nil)
                return
            }
            
            ///Print API response
            if data != nil, let dataString = String(data: data!, encoding: .utf8) {
                print("🔷 DataString: \(dataString)")
            }
            
            ///Check for Invalid statusCode
            print("🔷 StatusCode: \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
            if let httpResponse = response as? HTTPURLResponse {
 
                if !((200...299).contains(httpResponse.statusCode)) {
                    var errors: [String:[String]]?
                    if httpResponse.statusCode == 422 { // Validation error
                        do {
                            let json = try JSONSerialization.jsonObject(with:data!, options :[]) as? [String:Any]
                            if let results = json!["errors"] as? [String:[String]] {
                                errors = results
                            }
                        } catch {}
                        print("❌ Validation Error: \(APIRequestError.validationError.localizedDescription)")
                        print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
                        completion(APIRequestError.validationError, nil, errors)
                    } else {
                    }
                     return
                }
            }
            
            ///Check for Invalid mimeType
            print("🔷 MIME: \(String(describing: response?.mimeType))")
            if let mime = response?.mimeType, mime != "application/json" {
                print("❌ Error: \(APIRequestError.invalidMIME(mime: mime).localizedDescription)")
                print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
                completion(APIRequestError.invalidMIME(mime: mime), nil, nil)
                return
            }
            
            ///Check if data is nil
            guard data != nil else {
                print("❌ Error: \(APIRequestError.nilData.localizedDescription)")
                print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
                completion(APIRequestError.nilData, nil, nil)
                return
            }
            
            ///Parsing data to a valid format
            if let apiResponse = DataType(data: data!) {
                //print("✅ Data: \(apiResponse)")
                print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
                completion(nil, apiResponse, nil)
                
            } else {
                print("❌ Error: \(APIRequestError.parsingError.localizedDescription)")
                print("✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦")
                completion(APIRequestError.parsingError, nil, nil)
            }
            return
            }.resume()
    }
}
