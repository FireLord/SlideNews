//
//  GetAllNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class GetAllNewsUseCase {
    static let shared = GetAllNewsUseCase()
    
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository = NewsRepositoryImpl.shared) {
        self.newsRepository = newsRepository
    }
    
    func execute(category: String) async throws -> [Article] {
        return try await newsRepository.getAllNews(category: category)
    }
}
