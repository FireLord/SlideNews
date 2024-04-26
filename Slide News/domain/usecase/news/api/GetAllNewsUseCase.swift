//
//  GetAllNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class GetAllNewsUseCase {
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func execute(category: String) async throws -> [Article] {
        return try await newsRepository.getAllNews(category: category)
    }
}
