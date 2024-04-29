//
//  SignOutUseCase.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

final class SignOutUseCase {
    static let shared = SignOutUseCase()
    
    let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepositoryImpl.shared) {
        self.authRepository = authRepository
    }
    
    func execute() -> Bool {
        return authRepository.signOut()
    }
}
