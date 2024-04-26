//
//  GetSavedNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class GetSavedNewsUseCase {
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository) {
        self.newsRepository = newsRepository
    }
    
    func execute() async throws -> [Article] {
        return try await newsRepository.getSavedNews()
    }
}
