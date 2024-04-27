//
//  NewsRepositoryImpl.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class NewsRepositoryImpl: NewsRepository {
    let newsRemoteDataSource: NewsRemoteDataSource
    let newsLocalDataSource: NewsLocalDataSource
    
    init(newsRemoteDataSource: NewsRemoteDataSource, newsLocalDataSource: NewsLocalDataSource) {
        self.newsRemoteDataSource = newsRemoteDataSource
        self.newsLocalDataSource = newsLocalDataSource
    }
    
    func getAllNews(category: String) async throws -> [Article] {
        return try await newsRemoteDataSource.getAllNews(category: category)
    }
    
    func getSearchNews(searchQuery: String) async throws -> [Article] {
        return try await newsRemoteDataSource.getSearchNews(searchQuery: searchQuery)
    }
    
    func getSavedNews() async throws -> [Article] {
        return try newsLocalDataSource.getSavedNews()
    }
    
    func saveNews(article: Article) async throws {
        return newsLocalDataSource.saveNews(article: article)
    }
    
    func deleteSavedNews(article: Article) async throws {
        return try newsLocalDataSource.deleteSavedNews(article: article)
    }
}
