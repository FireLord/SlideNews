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
    @StateObject var loginViewModel = LoginViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "homeOpen") {
                MainTabView()
                    .environmentObject(appViewModel)
                    .environmentObject(loginViewModel)
            } else {
                LoginView()
                    .environmentObject(appViewModel)
                    .environmentObject(loginViewModel)
            }
        }
        .modelContainer(SlideNewsDatabase.shared.container)
    }
}
