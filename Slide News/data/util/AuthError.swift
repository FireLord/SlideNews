//
//  AuthError.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

enum AuthError: Error {
    case loginError
    case invalidEmailError
    case userExistError
    case wrongPasswordError
}
