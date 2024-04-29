//
//  DeleteSavedNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class DeleteSavedNewsUseCase {
    static let shared = DeleteSavedNewsUseCase()
    
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository = NewsRepositoryImpl.shared) {
        self.newsRepository = newsRepository
    }
    
    func execute(article: Article) async throws {
        return try await newsRepository.deleteSavedNews(article: article)
    }
}
