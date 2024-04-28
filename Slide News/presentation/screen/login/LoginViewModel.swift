//
//  LoginViewModel.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import Firebase

@MainActor
final class LoginViewModel: ObservableObject {
    // MARK: login variables
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var alertItem: AlertItem?
    
    // MARK: Auth Usecase
    private let googleLoginUseCase = GoogleLoginUseCase.shared
    private let loginEmailUseCase = LoginEmailUseCase.shared
    private let fetchUserUseCase = FetchUserUseCase.shared
    private let createUserUseCase = CreateUserUseCase.shared
    private let signOutUseCase = SignOutUseCase.shared
    private let saveUserUseCase = SaveUserUseCase.shared
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    // MARK: Login functions
    func signIn(withEmail email: String, password: String) async throws {
        do {
            userSession = try await loginEmailUseCase.execute(withEmail: email, password: password)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        alertItem = AlertContext.noInternetConnection
            } else if let firError = error as? AuthError {
                switch firError {
                case .invalidEmailError:
                    alertItem = AlertContext.invalidEmail
                case .wrongPasswordError:
                    alertItem = AlertContext.wrongPasswordError
                default:
                    alertItem = AlertContext.loginError
                }
            }
        }
    }
    
    func signInGoogle() async throws {
        do {
            userSession = try await googleLoginUseCase.execute()
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        alertItem = AlertContext.noInternetConnection
            } else if let firError = error as? AuthError {
                switch firError {
                case .invalidEmailError:
                    alertItem = AlertContext.invalidEmail
                default:
                    alertItem = AlertContext.loginError
                }
            }
        }
    }
    
    func createUserAccount(withEmail email: String, password: String) async throws {
        do {
            userSession = try await createUserUseCase.execute(withEmail: email, password: password)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                        alertItem = AlertContext.noInternetConnection
            } else if let firError = error as? AuthError {
                switch firError {
                case .invalidEmailError:
                    alertItem = AlertContext.invalidEmail
                case .userExistError:
                    alertItem = AlertContext.userExistError
                default:
                    alertItem = AlertContext.loginError
                }
            }
        }
    }
    
    func fetchUserAccount() async throws {
        do {
            currentUser = try await fetchUserUseCase.execute()
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func saveUserAccount(user: User) async throws {
        do {
            try await saveUserUseCase.execute(user: user)
        } catch {
            if let urlError = error as? URLError, urlError.code == .notConnectedToInternet {
                alertItem = AlertContext.noInternetConnection
            }
        }
    }
    
    func signOut() {
        let resultBool = signOutUseCase.execute()
        if resultBool {
            userSession = nil
            currentUser = nil
        }
    }
}
