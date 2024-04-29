//
//  CreateUserUseCase.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import Firebase

final class CreateUserUseCase {
    static let shared = CreateUserUseCase()
    
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepositoryImpl.shared) {
        self.authRepository = authRepository
    }
    
    func execute(withEmail email: String, password: String) async throws -> Firebase.User? {
        return try await authRepository.createUser(withEmail: email, password: password)
    }
}
