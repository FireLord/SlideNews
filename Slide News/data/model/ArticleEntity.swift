//
//  ArticleEntity.swift
//  Slide News
//
//  Created by Aman Kumar on 27/04/24.
//

import Foundation
import SwiftData

@Model
class ArticleEntity {
    var id: String
    var author: String?
    var title: String
    var _description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
    
    init(id: String, author: String? = nil, title: String, _description: String? = nil, url: String, urlToImage: String? = nil, publishedAt: String, content: String? = nil) {
        self.id = id
        self.author = author
        self.title = title
        self._description = _description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}
