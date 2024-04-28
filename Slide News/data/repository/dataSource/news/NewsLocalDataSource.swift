//
//  NewsLocalDataSource.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

protocol NewsLocalDataSource {
    // MARK: DB calling functions (crud)
    func getSavedNewsFromDb() throws -> [Article]
    func saveNewsToDb(article: Article)
    func deleteSavedNewsFromDb(article: Article) throws
}
