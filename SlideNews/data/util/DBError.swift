//
//  DBError.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

enum DBError: Error {
    case dataSourceError
    case createError
    case deleteError
    case updateError
    case fetchError
}
