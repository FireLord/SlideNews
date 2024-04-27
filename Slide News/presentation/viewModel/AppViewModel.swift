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
    @Published var articleDbList: [Article] = []
    
    // TODO: Find better way to do DI if this isn't
    // MARK: API usecase
    private let getAllNewsUseCase = GetAllNewsUseCase.shared
    private let getSearchNewsUseCase = GetSearchNewsUseCase.shared
    
    // MARK: News DB usecase
    private let getSavedNewsUseCase = GetSavedNewsUseCase.shared
    private let saveNewsUseCase = SaveNewsUseCase.shared
    private let deleteSavedNewsUseCase = DeleteSavedNewsUseCase.shared

    
    // MARK: API functions
    func getAllNews(category: String) async {
        isLoading = true
        do {
            if articleFetchList.isEmpty {
                articleFetchList = try await getAllNewsUseCase.execute(category: category)
            }
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
            articleFetchList = try await getSearchNewsUseCase.execute(searchQuery: searchQuery)
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
    
    // MARK: News DB functions
    func getAllSavedNews() async throws {
        isLoading = true
        do  {
            articleDbList = try await getSavedNewsUseCase.execute()
            isLoading = false
        } catch {
            if let dbError = error as? DBError {
                switch dbError {
                case .fetchError:
                    alertItem = AlertContext.fetchError
                default:
                    alertItem = AlertContext.dataSourceError
                }
            }
            isLoading = false
        }
    }
    
    func saveNews(article: Article) async throws {
        do  {
            try await saveNewsUseCase.execute(article: article)
        } catch {
            if let dbError = error as? DBError {
                switch dbError {
                case .createError:
                    alertItem = AlertContext.createError
                default:
                    alertItem = AlertContext.dataSourceError
                }
            }
        }
    }
    
    func deleteSavedNews(article: Article) async throws {
        do  {
            try await deleteSavedNewsUseCase.execute(article: article)
            articleDbList = try await getSavedNewsUseCase.execute() // TODO: use combine or better way
        } catch {
            if let dbError = error as? DBError {
                switch dbError {
                case .deleteError:
                    alertItem = AlertContext.deleteError
                default:
                    alertItem = AlertContext.dataSourceError
                }
            }
        }
    }
}
