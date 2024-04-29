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
    
    func getSavedNews() throws -> [Article] {
        let fetchDescriptor = FetchDescriptor<ArticleEntity>()
        let articleEntities = try slideNewsDatabase.context.fetch(fetchDescriptor)
        let articles = articleEntities.map { articleEntity in
            return Article(
                id: articleEntity.id,
                author: articleEntity.author,
                title: articleEntity.title,
                description: articleEntity._description,
                url: articleEntity.url,
                urlToImage: articleEntity.urlToImage, 
                publishedAt: articleEntity.publishedAt,
                content: articleEntity.content
            )
        }
        return articles
    }
    
    func saveNews(article: Article) {
        let articleEntity = ArticleEntity(
            id: article.id,
            author: article.author,
            title: article.title,
            _description: article.description,
            url: article.url,
            urlToImage: article.urlToImage, 
            publishedAt: article.publishedAt,
            content: article.content
        )
        
        slideNewsDatabase.context.insert(articleEntity)
    }
    
    func deleteNews(article: Article) throws {
        let fetchDescriptor = FetchDescriptor<ArticleEntity> (
            predicate: #Predicate {
                $0.title == article.title
            }
        )
        
        if let articleEntity = try slideNewsDatabase.context.fetch(fetchDescriptor).first {
            slideNewsDatabase.context.delete(articleEntity)
        } else {
            throw DBError.deleteError
        }
    }
}