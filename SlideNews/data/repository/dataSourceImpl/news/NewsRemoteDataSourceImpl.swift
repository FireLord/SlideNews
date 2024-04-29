//
//  NewsRemoteDataSourceImpl.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class NewsRemoteDataSourceImpl: NewsRemoteDataSource {
    static let shared = NewsRemoteDataSourceImpl()
    
    func getAllNews(category: String) async throws -> [Article] {
        return try await NewsAPIService.shared.getAllNews(category: category)
    }
    
    func getSearchNews(searchQuery: String) async throws -> [Article] {
        return try await NewsAPIService.shared.getSearchedNews(searchQuery: searchQuery)
    }
}
