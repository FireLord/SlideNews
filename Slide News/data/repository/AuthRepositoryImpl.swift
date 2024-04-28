//
//  AuthRepositoryImpl.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import Firebase

final class AuthRepositoryImpl: AuthRepository {
    static let shared = AuthRepositoryImpl()
    
    let firebaseAuthDataSource: FirebaseAuthDataSource
    
    init(firebaseAuthDataSource: FirebaseAuthDataSource = FirebaseAuthRemoteDataSourceImpl.shared) {
        self.firebaseAuthDataSource = firebaseAuthDataSource
    }
    
    func loginIn(withEmail email: String, password: String) async throws -> Firebase.User? {
        return try await firebaseAuthDataSource.loginIn(withEmail: email, password: password)
    }
    
    func createUser(withEmail email: String, password: String) async throws -> Firebase.User? {
        return try await firebaseAuthDataSource.createUser(withEmail: email, password: password)
    }
    
    func signInGoogle() async throws -> Firebase.User? {
        return try await firebaseAuthDataSource.signInGoogle()
    }
    
    func signOut() -> Bool {
        return firebaseAuthDataSource.signOut()
    }
    
    func fetchUser() async throws -> User? {
        return try await firebaseAuthDataSource.fetchUser()
    }
    
    func saveUser(user: User) async throws -> Bool {
        return try await firebaseAuthDataSource.saveUser(user: user)
    }
}
