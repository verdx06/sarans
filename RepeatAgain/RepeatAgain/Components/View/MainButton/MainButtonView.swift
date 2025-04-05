//
//  MainButtonView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct MainButtonView: View {
    
    let text: String
    let action: () -> Void
    let color: Color
    let isProgress: Bool
    
    init(text: String, action: @escaping () -> Void, color: Color = .hex5B7BFE, isProgress: Bool = false) {
        self.text = text
        self.action = action
        self.color = color
        self.isProgress = isProgress
    }
    
    var body: some View {
        if isProgress {
            ProgressView()
                .fredokaFont(size: 20, font: .medium)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .foregroundStyle(.white)
                .background(color)
                .cornerRadius(12)
                .padding(.horizontal, 45)
        } else {
            Button {
                action()
            } label: {
                Text(text)
                    .fredokaFont(size: 20, font: .medium)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .foregroundStyle(.white)
                    .background(color)
                    .cornerRadius(12)
                    .padding(.horizontal, 45)
            }

        }
    }
}

#Preview {
    MainButtonView(text: "Choose a language") {
        //
    }
}
