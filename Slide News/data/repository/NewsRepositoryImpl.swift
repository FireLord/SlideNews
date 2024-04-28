//
//  NewsRepositoryImpl.swift
//  Slide News
//
//  Created by admin on 26/04/24.
//

import Foundation
import Firebase

final class NewsRepositoryImpl: NewsRepository {
    static let shared = NewsRepositoryImpl()
    
    let newsRemoteDataSource: NewsRemoteDataSource
    let newsLocalDataSource: NewsLocalDataSource
    let newsFirebaseDataSource: NewsFirebaseDataSource
    
    init(
        newsRemoteDataSource: NewsRemoteDataSource = NewsRemoteDataSourceImpl.shared,
        newsLocalDataSource: NewsLocalDataSource = NewsLocalDataSourceImpl.shared,
        newsFirebaseDataSource: NewsFirebaseDataSource = NewsFirebaseDataSourceImpl.shared
    ) {
        self.newsRemoteDataSource = newsRemoteDataSource
        self.newsLocalDataSource = newsLocalDataSource
        self.newsFirebaseDataSource = newsFirebaseDataSource
    }
    
    func getAllNews(category: String) async throws -> [Article] {
        return try await newsRemoteDataSource.getAllNews(category: category)
    }
    
    func getSearchNews(searchQuery: String) async throws -> [Article] {
        return try await newsRemoteDataSource.getSearchNews(searchQuery: searchQuery)
    }
    
    func getSavedNews() async throws -> [Article] {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try newsLocalDataSource.getSavedNewsFromDb()
        } else {
            do {
                // Retrieve saved songs from local database
                let savedNewsFromLocalDB = try newsLocalDataSource.getSavedNewsFromDb()
                
                if savedNewsFromLocalDB.isEmpty {
                    // Local database is empty, populate it from Firebase
                    let savedNewsFromFirebase = try await newsFirebaseDataSource.getSavedNewsFromFb()
                    // Populate the local database with songs from Firebase
                    for article in savedNewsFromFirebase {
                        newsLocalDataSource.saveNewsToDb(article: article)
                    }
                    // Return saved songs from firebase database as its already fetched
                    return savedNewsFromFirebase
                } else {
                    // Local database is not empty, return saved songs from local database
                    return savedNewsFromLocalDB
                }
            } catch {
                throw DBError.fetchError
            }
        }
    }
    
    func saveNews(article: Article) async throws {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return newsLocalDataSource.saveNewsToDb(article: article)
        } else {
            do {
                let fbSave = try await newsFirebaseDataSource.saveNewsToFb(article: article)
                if fbSave {
                    newsLocalDataSource.saveNewsToDb(article: article)
                }
            } catch {
                throw DBError.createError
            }
        }
    }
    
    func deleteSavedNews(article: Article) async throws {
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            return try newsLocalDataSource.deleteSavedNewsFromDb(article: article)
        } else {
            do {
                let fbDelete = try await newsFirebaseDataSource.deleteSavedNewsFromFb(article: article)
                if fbDelete {
                    try newsLocalDataSource.deleteSavedNewsFromDb(article: article)
                }
            } catch {
                throw DBError.deleteError
            }
        }
    }
}
