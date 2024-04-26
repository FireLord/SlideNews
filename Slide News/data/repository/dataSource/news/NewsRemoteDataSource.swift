//
//  NewsRemoteDataSource.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

protocol NewsRemoteDataSource {
    // MARK: API calling functions
    func getAllNews(category: String) async throws -> [Article]
    func getSearchNews(searchQuery: String) async throws -> [Article]
}
