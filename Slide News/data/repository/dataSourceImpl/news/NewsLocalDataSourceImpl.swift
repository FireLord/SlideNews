//
//  NewsLocalDataSourceImpl.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

final class NewsLocalDataSourceImpl: NewsLocalDataSource {
    let newsDao: NewsDao
    
    init(newsDao: NewsDao) {
        self.newsDao = newsDao
    }
    
    func getSavedNews() throws -> [Article] {
        return try newsDao.getSavedNews()
    }
    
    func saveNews(article: Article) {
        return newsDao.saveNews(article: article)
    }
    
    func deleteSavedNews(article: Article) throws {
        return try newsDao.deleteNews(article: article)
    }
}
