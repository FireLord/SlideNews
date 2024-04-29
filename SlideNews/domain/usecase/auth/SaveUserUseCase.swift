//
//  SaveUserUseCase.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

final class SaveUserUseCase {
    static let shared = SaveUserUseCase()
    
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepositoryImpl.shared) {
        self.authRepository = authRepository
    }
    
    func execute(user: User) async throws -> Bool {
        return try await authRepository.saveUser(user: user)
    }
}
