//
//  FetchUserUseCase.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

final class FetchUserUseCase {
    static let shared = FetchUserUseCase()
    
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepositoryImpl.shared) {
        self.authRepository = authRepository
    }
    
    func execute() async throws -> User? {
        return try await authRepository.fetchUser()
    }
}
