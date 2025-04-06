//
//  RepeatAgainApp.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

@main
struct RepeatAgainApp: App {
    
    let lastwatched: String?
    
    init() {
        lastwatched = UserDefaults.standard.string(forKey: UserKey.lastwatched.rawValue)
    }
    
    var body: some Scene {
        WindowGroup {
            SpeechView()
        }
    }
}
