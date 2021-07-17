//
//  APIRequestError.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

/// This enum will be used to determine the type of error of the API request.
///
/// - **invalidURL**: If the URL is in invalid format.
/// - **clientError**: If the request fails (from the client side not the server),
///   this error contains information about the failure.
///   *NOTE*: If a response from the server is received, regardless of whether the request completes successfully or fails,
///   this error will not be fired.
/// - **serverError**: If the server responsed with an error, this error will contains the status code
///   to indicate the type of this error.
/// - **invalidMIME**: If the MIME type returned from the server is incorrectly,
///   such as expecting mime of type "application/json" and the server returned something else.
/// - **nilData**: If the data returned from the request is nil.
/// - **parsingError**: If the response is not parsed successfully to the given response model.
///
/// - Author: Amr Saleh.
/// - Date: January 19, 2020.

enum APIRequestError: Error, Equatable {
    case invalidURL
    case clientError(description: String)
    case serverError(message: String)
    case invalidMIME(mime: String)
    case nilData
    case parsingError
    case validationError
    case authorizationError
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "invalidURL".localized
        case .clientError(let description):
            return "\("clientError".localized): \(description)"
        case .serverError(let message):
            return message
        case .invalidMIME(let mime):
            return "\("invalidMIME".localized) \(mime)"
        case .nilData:
            return "noDataFound".localized
        case .parsingError:
            return "dataParsingErrors".localized
        case .validationError:
            return "validationError".localized
        case .authorizationError:
            return "authorizationError".localized
        }
    }
}
