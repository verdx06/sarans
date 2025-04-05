//
//  SelectLanguageView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import SwiftUI

extension SelectLanguageView {
    class ViewModel: ObservableObject {
        
        @Published var languages = ["Russian","English","Chinese","Belarus","Kazakh"]
        @Published var isNavigate: Bool = false
        @Published var isSelected: String = ""
        
        @Published var systemCode = Locale.current.language.languageCode?.identifier
        @Published var systemCodeString: String? = {
            let pref = Locale.preferredLanguages.first ?? "en"
            let systemCode = Locale(identifier: pref).languageCode ?? "en"
            let englishFormat = Locale(identifier: "en_US")
            return englishFormat.localizedString(forLanguageCode: systemCode)
        }()
        
        
        func setNewLanguage(language: String) {
            
            UserDefaults.standard.set([language], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set("signup", forKey: UserKey.lastwatched.rawValue)
            
        }
        
    }
}
