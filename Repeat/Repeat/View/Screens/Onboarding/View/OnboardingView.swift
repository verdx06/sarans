//
//  ContentView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            if let current = vm.currentQueue {
                Spacer()
                Image(current.image)
                Spacer()
                Steps(steps: current.id)
                    .padding(.bottom, 25)
                VStack(spacing: 0){
                    Text(current.text)
                        .fredokaFont(size: 22, font: .medium)
                        .padding(.vertical,8)
                    Text(current.subtext)
                        .fredokaFont(size: 15)
                        .padding(.bottom)
                        .foregroundStyle(Color.black.opacity(0.6))
                }.multilineTextAlignment(.center)
                
                
                MainButtonView(text: vm.buttonTitle) {
                    withAnimation(.easeInOut) {
                        vm.next()
                    }
                }.padding(.vertical)
                
                Button {
                    withAnimation {
                        vm.skip()
                    }
                } label: {
                    Text("Skip onboarding")
                        .fredokaFont(size: 15)
                }.padding(.bottom, 60)

            }
        }.navigationDestination(isPresented: $vm.isNavigate, destination: {
            SelectLanguageView()
        })
    }
}

#Preview {
    NavigationStack {
        OnboardingView()
    }
}
