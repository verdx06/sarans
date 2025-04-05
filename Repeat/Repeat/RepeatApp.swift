//
//  RepeatApp.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import SwiftUI

@main
struct RepeatApp: App {
    
    let lastwatched: String?
    
    init() {
        lastwatched = UserDefaults.standard.string(forKey: UserKey.lastwatched.rawValue)
    }
    
    var body: some Scene {
        WindowGroup {
                SplashScreen(lastwatched: lastwatched)
        }
    }
}
