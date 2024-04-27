//
//  NewsDao.swift
//  Slide News
//
//  Created by Aman Kumar on 27/04/24.
//

import Foundation
import SwiftData

final class NewsDao {
    static let shared = NewsDao()
    
    let slideNewsDatabase: SlideNewsDatabase
    
    init(slideNewsDatabase: SlideNewsDatabase = SlideNewsDatabase.shared) {
        self.slideNewsDatabase = slideNewsDatabase
    }
    
    func getSavedNews() throws -> [ArticleEntity] {
        let fetchDescriptor = FetchDescriptor<ArticleEntity> (
            predicate: #Predicate {
                $0.title != "My"
            }
        )
        
        let articleList = try slideNewsDatabase.context.fetch(fetchDescriptor)
        return articleList
    }
    
    func saveNews(article: Article) {
        let articleEntity = ArticleEntity(
            author: article.author,
            title: article.title,
            _description: article.description,
            url: article.url,
            urlToImage: article.urlToImage,
            content: article.content
        )
        
        slideNewsDatabase.context.insert(articleEntity)
    }
    
    func deleteNews(article: Article) {
        let articleEntity = ArticleEntity(
            author: article.author,
            title: article.title,
            _description: article.description,
            url: article.url,
            urlToImage: article.urlToImage,
            content: article.content
        )
        
        slideNewsDatabase.context.delete(articleEntity)
    }
}
