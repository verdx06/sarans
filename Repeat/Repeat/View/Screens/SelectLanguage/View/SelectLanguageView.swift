//
//  SelectLanguageView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import SwiftUI

struct SelectLanguageView: View {
    
    @State var isConnect: Bool = false
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            
            Text("What is your Mother language? ")
                .fredokaFont(size: 22, font: .medium)
            
            ForEach(vm.languages, id: \.self ) { language in
                Button {
                    if language == "English" || language == vm.systemCodeString {
                        vm.isSelected = language

                    }
                } label: {
                    LanguageView(text: language, active: vm.isSelected == language)
                }
            }
            
            Spacer()
            
            MainButtonView(text: "choose") {
                if vm.isSelected == vm.systemCodeString {
                    if let system = vm.systemCode {
                        vm.setNewLanguage(language: system)
                    }
                } else if vm.isSelected == "English" {
                    vm.setNewLanguage(language: "en")
                }
                vm.isNavigate = true
            }
            
        }.header(text: "Language select")
            .modifier(NetworkModifier(isConnect: $isConnect))
            .navigationDestination(isPresented: $vm.isNavigate) { 
                SignUpView()
            }
    }
}

#Preview {
    NavigationStack {
        SelectLanguageView()
    }
}
