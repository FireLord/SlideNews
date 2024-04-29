//
//  FirebaseAuthDataSource.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import Firebase

protocol FirebaseAuthDataSource {
    func loginIn(withEmail email: String, password: String) async throws -> Firebase.User?
    func createUser(withEmail email: String, password: String) async throws -> Firebase.User?
    func signInGoogle() async throws -> Firebase.User?
    func signOut() -> Bool
    func fetchUser() async throws -> User?
    func saveUser(user: User) async throws -> Bool
}
