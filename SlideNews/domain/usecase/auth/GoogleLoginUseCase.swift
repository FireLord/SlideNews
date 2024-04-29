//
//  GoogleLoginUseCase.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import Firebase

final class GoogleLoginUseCase {
    static let shared = GoogleLoginUseCase()
    
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepositoryImpl.shared) {
        self.authRepository = authRepository
    }
    
    func execute() async throws -> Firebase.User? {
        return try await authRepository.signInGoogle()
    }
}
