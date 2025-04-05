//
//  SplashScreen.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isLoading: Bool = false
    let lastwatched: String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.hex410FA3.ignoresSafeArea()
                VStack {
                    Image("Logo")
                    Text("Language App")
                        .fredokaFont(size: 36, font: .semibold)
                        .foregroundStyle(Color.white)
                }
                
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isLoading = true
                    }
                }
            } .fullScreenCover(isPresented: $isLoading) {
                if lastwatched == "signup" {
                    SignUpView()
                }
                else if lastwatched == "4" {
                    SelectLanguageView()
                } else {
                    OnboardingView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SplashScreen(lastwatched: "0")
    }
}
