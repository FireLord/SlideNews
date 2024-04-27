//
//  GetSavedNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class GetSavedNewsUseCase {
    static let shared = GetSavedNewsUseCase()
    
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository = NewsRepositoryImpl.shared) {
        self.newsRepository = newsRepository
    }
    
    func execute() async throws -> [Article] {
        return try await newsRepository.getSavedNews()
    }
}
