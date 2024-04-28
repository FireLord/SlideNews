//
//  Slide_NewsApp.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct SlideNewsApp: App {
    @StateObject var appViewModel = AppViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(appViewModel)
        }
        .modelContainer(SlideNewsDatabase.shared.container)
    }
}
