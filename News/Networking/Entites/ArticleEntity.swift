//
//  ArticleEntity.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import Foundation

// MARK: - Article
struct ArticleEntity: Decodable {
    let source: SourceEntity?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
