//
//  SaveNewsUseCase.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation

final class SaveNewsUseCase {
    static let shared = SaveNewsUseCase()
    
    let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository = NewsRepositoryImpl.shared) {
        self.newsRepository = newsRepository
    }
    
    func execute(article: Article) async throws {
        try await newsRepository.saveNews(article: article)
    }
}
