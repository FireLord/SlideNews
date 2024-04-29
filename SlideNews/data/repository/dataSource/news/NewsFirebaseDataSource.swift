//
//  NewsFirebaseDataSource.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

protocol NewsFirebaseDataSource {
    // MARK: DB calling functions (crud)
    func getSavedNewsFromFb() async throws -> [Article]
    func saveNewsToFb(article: Article) async throws -> Bool
    func deleteSavedNewsFromFb(article: Article) async throws -> Bool
}
