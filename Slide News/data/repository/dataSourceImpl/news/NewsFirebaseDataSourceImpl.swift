//
//  NewsFirebaseDataSourceImpl.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import Firebase

final class NewsFirebaseDataSourceImpl: NewsFirebaseDataSource {
    static let shared = NewsFirebaseDataSourceImpl()
    
    func getSavedNewsFromFb() async throws -> [Article] {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost) }
            let querySnapshot = try await Firestore.firestore().collection("users").document(uid).collection("news").getDocuments()
            var articles: [Article] = []
            for document in querySnapshot.documents {
                if let articleData = document.data()["article"] as? [String: Any] {
                    var article = try Firestore.Decoder().decode(Article.self, from: articleData)
                    article.id = document.documentID
                    articles.append(article)
                }
            }
            return articles
        } catch {
            throw DBError.fetchError
        }
    }
    
    func saveNewsToFb(article: Article) async throws -> Bool {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost)  }
            var encodeNews = try Firestore.Encoder().encode(article)
            encodeNews["id"] = article.id
            try await Firestore.firestore().collection("users").document(uid).collection("news").document(article.id).setData(["article": encodeNews])
            return true
        } catch {
            throw DBError.createError
        }
    }
    
    func deleteSavedNewsFromFb(article: Article) async throws -> Bool {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { throw URLError(.cannotFindHost) }
            guard let snapshot =
                    try? await Firestore.firestore().collection("users").document(uid).collection("news").document(article.id).getDocument()
            else {
                throw URLError(.cannotFindHost)
            }
            try await snapshot.reference.delete()
            return true
        } catch {
            throw DBError.deleteError
        }
    }
}
