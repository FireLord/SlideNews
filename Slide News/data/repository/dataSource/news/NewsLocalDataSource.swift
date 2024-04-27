//
//  NewsLocalDataSource.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

protocol NewsLocalDataSource {
    // MARK: DB calling functions (crud)
    func getSavedNews() throws -> [Article]
    func saveNews(article: Article)
    func deleteSavedNews(article: Article) throws
}
