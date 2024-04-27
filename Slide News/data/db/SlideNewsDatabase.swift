//
//  SlideNewsDatabase.swift
//  Slide News
//
//  Created by Aman Kumar on 27/04/24.
//

import Foundation
import SwiftData

final class SlideNewsDatabase {
    static let shared = SlideNewsDatabase()
    
    let container: ModelContainer
    let context: ModelContext
    
    init() {
        container = {
            let schema = Schema([ArticleEntity.self])
            do {
                let container = try ModelContainer(for: schema, configurations: [])
                return container
            } catch {
                fatalError("Cannot Load Swift Data")
            }
        }()
        
        context = ModelContext(container)
    }
}
