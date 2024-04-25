//
//  NewsRepository.swift
//  Slide News
//
//  Created by Aman Kumar on 26/04/24.
//

import Foundation

protocol NewsRepository {
    // MARK: API calling functions
    func getAllNews(category: String) async throws -> [Article]
    
    // MARK: DB calling functions (crud)
    func getSavedNews() async throws -> [Article]
    func saveNews(article: Article) async throws -> ()
    func deleteSavedSong(article: Article) async throws -> ()
}
