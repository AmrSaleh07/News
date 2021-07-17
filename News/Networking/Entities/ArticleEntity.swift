//
//  ArticleEntity.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation
import Gloss

// MARK: - Article
public struct ArticleEntity: Glossy {

    public let author : String?
    public let content : String?
    public let descriptionField : String?
    public let publishedAt : String?
    public let source : SourceEntity?
    public let title : String?
    public let url : String?
    public let urlToImage : String?



    // MARK: - Decodable
    public init?(json: JSON) {
        author = "author" <~~ json
        content = "content" <~~ json
        descriptionField = "description" <~~ json
        publishedAt = "publishedAt" <~~ json
        source = "source" <~~ json
        title = "title" <~~ json
        url = "url" <~~ json
        urlToImage = "urlToImage" <~~ json
    }


    // MARK: - Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "author" ~~> author,
        "content" ~~> content,
        "description" ~~> descriptionField,
        "publishedAt" ~~> publishedAt,
        "source" ~~> source,
        "title" ~~> title,
        "url" ~~> url,
        "urlToImage" ~~> urlToImage
        ])
    }

}
