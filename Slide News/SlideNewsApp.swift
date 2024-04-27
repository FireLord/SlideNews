//
//  Slide_NewsApp.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI
import SwiftData

@main
struct SlideNewsApp: App {
    @StateObject var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView().environmentObject(appViewModel)
        }
        .modelContainer(SlideNewsDatabase.shared.container)
//        .modelContainer(for: ArticleEntity.self)
    }
}
