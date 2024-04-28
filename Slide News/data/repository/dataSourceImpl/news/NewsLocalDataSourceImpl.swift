//
//  NewsLocalDataSourceImpl.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

final class NewsLocalDataSourceImpl: NewsLocalDataSource {
    static let shared = NewsLocalDataSourceImpl()
    
    let newsDao: NewsDao
    
    init(newsDao: NewsDao = NewsDao.shared) {
        self.newsDao = newsDao
    }
    
    func getSavedNewsFromDb() throws -> [Article] {
        return try newsDao.getSavedNews()
    }
    
    func saveNewsToDb(article: Article) {
        return newsDao.saveNews(article: article)
    }
    
    func deleteSavedNewsFromDb(article: Article) throws {
        return try newsDao.deleteNews(article: article)
    }
}
