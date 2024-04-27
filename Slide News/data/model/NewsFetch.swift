//
//  NewsFetch.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import Foundation

struct NewsFetch: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    static let sampleArticleList = [
        Article.sampleArticle,
        Article.sampleArticle,
        Article.sampleArticle,
        Article.sampleArticle
    ]
}

struct Article: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
    static let sampleArticle = Article(
        author: "Lifestyle Desk",
        title: "Nutrition alert: Here’s what a 100-gram serving of persimmon contains - The Indian Express",
        description: "Bollywood actress Katrina Kaif starts her day with persimmons! Learn why this vibrant fruit is a nutritional powerhouse. Persimmon benefits include boosted immunity, healthy vision, digestion, and heart health. Enjoy persimmons fresh, baked, dried, or in swee…",
        url: "https://indianexpress.com/article/lifestyle/food-wine/nutrition-alert-heres-what-a-100-gram-serving-of-persimmon-contains-9266141/",
        urlToImage: "https://images.indianexpress.com/2024/04/persimmon-1.jpg",
        publishedAt: "2024-04-26T18:27:44Z",
        content: "Bollywood actress Katrina Kaifrecently revealed in a candid interview that she starts her mornings with a delicious and nutritious fruit — persimmon.This lesser-known vibrant orange fruit, packed wit… [+3053 chars]"
    )
}
