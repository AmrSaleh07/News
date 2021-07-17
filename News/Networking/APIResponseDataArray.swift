//
//  APIResponseDataArray.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Gloss

struct APIResponseDataArray<DataType:Glossy>: Glossy {
    
    public let articles : [DataType]?
    public let status : String?
    public let totalResults : Int?
    
    // MARK: - Decodable
    public init?(json: JSON) {
        articles = "articles" <~~ json
        status = "status" <~~ json
        totalResults = "totalResults" <~~ json
    }
    
    
    // MARK: - Encodable
    public func toJSON() -> JSON? {
        return jsonify([
            "articles" ~~> articles,
            "status" ~~> status,
            "totalResults" ~~> totalResults
        ])
    }
}
