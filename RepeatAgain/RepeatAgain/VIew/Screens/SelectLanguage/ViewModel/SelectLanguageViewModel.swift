//
//  SelectLanguageViewModel.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import Foundation

class SelectLanguageViewModel: ObservableObject {
    
    @Published var isSelect: String = ""
    
    let languages: [String] = ["Russian", "English", "Chinese", "Belarus", "Kazakh"]
    
    let systemCode = Locale.current.language.languageCode?.identifier ?? "en"
    
    @Published var isNavigate: Bool = false
    
    let systemLanguageString: String? = {
        let pref = Locale.preferredLanguages.first ?? "en"
        let systemCode = Locale(identifier: pref).languageCode ?? "en"
        let englishFormat = Locale(identifier: "en_US")
        return englishFormat.localizedString(forLanguageCode: systemCode)
    }()
    
    func systemSetLanguage(_ language: String) {
        
        isNavigate = true
        UserDefaults.standard.set([languages], forKey: "AppleLanguage")
        UserDefaults.standard.synchronize()
        
    }
    
}
