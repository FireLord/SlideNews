//
//  NewsRepositoryImpl.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class NewsRepositoryImpl: NewsRepository {
    let newsRemoteDataSource: NewsRemoteDataSource
    
    init(newsRemoteDataSource: NewsRemoteDataSource) {
        self.newsRemoteDataSource = newsRemoteDataSource
    }
    
    func getAllNews(category: String) async throws -> [Article] {
        return try await newsRemoteDataSource.getAllNews(category: category)
    }
    
    func getSearchNews(searchQuery: String) async throws -> [Article] {
        return try await newsRemoteDataSource.getSearchNews(searchQuery: searchQuery)
    }
    
    func getSavedNews() async throws -> [Article] {
        <#code#>
    }
    
    func saveNews(article: Article) async throws {
        <#code#>
    }
    
    func deleteSavedNews(article: Article) async throws {
        <#code#>
    }
}
