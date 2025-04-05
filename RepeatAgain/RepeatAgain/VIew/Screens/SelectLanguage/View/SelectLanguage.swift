//
//  SelectLanguage.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct SelectLanguage: View {
    
    @StateObject var vm = SelectLanguageViewModel()
    
    var body: some View {
        VStack {
            Text("What is your Mother language?")
                .fredokaFont(size: 22, font: .medium)
            
            ForEach(vm.languages, id: \.self) { language in
                Button {
                    if language == "English" || language == vm.systemLanguageString {
                        vm.isSelect = language
                    }
                } label: {
                    Language(language: language, activity: vm.isSelect == language)
                }

            }
            
            Spacer()
            
            MainButtonView(text: "Choose a language") {
                if vm.isSelect == "English" {
                    vm.systemSetLanguage("en")
                } else if vm.isSelect == vm.systemLanguageString {
                    vm.systemSetLanguage(vm.systemCode)
                }
            }
            
        }
        .navigationDestination(isPresented: $vm.isNavigate, destination: {
            SignupView()
        })
        .header(text: "Language select")
    }
}

#Preview {
    SelectLanguage()
}
