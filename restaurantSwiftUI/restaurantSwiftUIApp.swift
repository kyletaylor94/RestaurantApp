//
//  restaurantSwiftUIApp.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2022. 12. 30..
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct restaurantSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //init() {
       // FirebaseApp.configure()
   // }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
