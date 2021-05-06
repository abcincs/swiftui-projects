//
//  swiftui_firebaseApp.swift
//  swiftui-firebase
//
//  Created by Cédric Bahirwe on 06/05/2021.
//

import SwiftUI
import Firebase

@main
struct swiftui_firebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appdelegate
    @StateObject var viewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
