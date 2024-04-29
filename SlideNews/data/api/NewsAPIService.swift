//
//  NewsAPIService.swift
//  Slide News
//
//  Created by Aman Kumar on 23/04/24.
//

import Foundation

final class NewsAPIService {
    static let shared = NewsAPIService()
    static let baseURL = "https://newsapi.org/v2/"
    private let topHeadline = baseURL + "top-headlines"
    private let everything = baseURL + "everything"
    private let country = "in"
    private let apiKey = "605cf95fc97247b89e76fff31e4f75b6"
    
    func getAllNews(category: String) async throws -> [Article] {
        guard var urlComponent = URLComponents(string: topHeadline) else {
            throw APIError.invalidURL
        }
        
        urlComponent.queryItems = [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "category", value: category),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        
        guard let url = urlComponent.url else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(NewsFetch.self, from: data)
            return decodedResponse.articles
        } catch {
            throw APIError.invalidData
        }
    }
    
    func getSearchedNews(searchQuery: String) async throws -> [Article] {
        guard var urlComponent = URLComponents(string: everything) else {
            throw APIError.invalidURL
        }
        
        urlComponent.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "q", value: searchQuery)
        ]
        
        guard let url = urlComponent.url else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(NewsFetch.self, from: data)
            return decodedResponse.articles
        } catch {
            throw APIError.invalidData
        }
    }
}
