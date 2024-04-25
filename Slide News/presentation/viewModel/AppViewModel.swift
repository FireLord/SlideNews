//
//  AppViewModel.swift
//  Slide News
//
//  Created by Aman Kumar on 23/04/24.
//

import Foundation

@MainActor
final class AppViewModel: ObservableObject {
    @Published var articleFetchList: [Article] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isNavBarHidden: Bool = false
    
    // MARK: API functions
    func getAllNews(category: String) async {
        isLoading = true
        do {
            articleFetchList = try await NewsAPIService.shared.getAllNews(category: category)
            isLoading = false
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            } else if let scError = error as? APIError {
                switch scError {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                }
            }
            isLoading = false
        }
    }
    
    func getSearchNews(searchQuery: String) async {
        isLoading = true
        do {
            articleFetchList = try await NewsAPIService.shared.getSearchedNews(searchQuery: searchQuery)
            isLoading = false
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            } else if let scError = error as? APIError {
                switch scError {
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                case .invalidData:
                    alertItem = AlertContext.invalidData
                }
            }
            isLoading = false
        }
    }
}
