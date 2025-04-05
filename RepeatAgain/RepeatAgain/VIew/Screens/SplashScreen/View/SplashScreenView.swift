//
//  SplashScreenView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct SplashScreenView: View {
    
    let lastwatched: String?
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.hex410FA3.edgesIgnoringSafeArea(.all)
                VStack {
                    Image("Logo")
                    Text("Language App")
                        .fredokaFont(size: 36, font: .semibold)
                        .foregroundStyle(Color.white)
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = true
                }
            }
            .navigationDestination(isPresented: $isLoading) {
                if lastwatched == "4" {
                    SelectLanguage()
                } else {
                    OnboardingView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(lastwatched: "")
}
