//
//  SourceEntity.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation
import Gloss

// MARK: - Source
public struct SourceEntity: Glossy {

    public let id : String?
    public let name : String?



    // MARK: - Decodable
    public init?(json: JSON) {
        id = "id" <~~ json
        name = "name" <~~ json
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "id" ~~> id,
        "name" ~~> name
        ])
    }
}
