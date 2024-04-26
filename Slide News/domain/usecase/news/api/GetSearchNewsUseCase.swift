//
//  GetSearchNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class GetSearchNewsUseCase {
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func execute(searchQuery: String) async throws -> [Article] {
        return try await newsRepository.getSearchNews(searchQuery: searchQuery)
    }
}
