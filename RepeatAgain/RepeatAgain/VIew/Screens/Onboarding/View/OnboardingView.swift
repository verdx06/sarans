//
//  ContentView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var ovm = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                if let current = ovm.currentQueue {
                    Image(colorScheme == .dark ? current.image + "dark": current.image)
                    
                    Spacer(minLength: 110)
                    
                    StepView(queue: current.id)
                        .padding(.bottom)
                        .padding(.bottom)
                    
                    Text(current.text)
                        .fredokaFont(size: 22, font: .medium)
                        .padding(.bottom)
                    Text(current.subtext)
                        .fredokaFont(size: 15)
                        .padding(.bottom, 45)
                        .multilineTextAlignment(.center)
                    MainButtonView(text: current.buttonTitle) {
                        withAnimation {
                            ovm.next()
                        }
                    }
                    HStack(spacing: 0){
                        Text("Already a fillolearn user? ")
                            .fredokaFont(size: 15)
                            .foregroundStyle(colorScheme == .dark ? Color.white.opacity(0.5) : Color.black)
                        NavigationLink {
                            Login()
                        } label: {
                            Text("Log in")
                                .fredokaFont(size: 15, font: .semibold)
                                .foregroundStyle(.hex5B7BFE)
                        }


                    }.padding(.top)
                        .padding(.bottom)

                }
                
            }
        }.navigationDestination(isPresented: $ovm.isNavigate) {
            SelectLanguage()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingView()
    }
}
