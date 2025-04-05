//
//  MainButtonView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import SwiftUI

struct MainButtonView: View {
    
    let color: Color
    let isProgress: Bool
    let text: String
    let action: () -> Void
    
    init(color: Color = .hex5B7BFE, isProgress: Bool = false, text: String, action: @escaping () -> Void) {
        self.color = color
        self.isProgress = isProgress
        self.text = text
        self.action = action
    }
    
    var body: some View {
        if isProgress {
            ProgressView()
                .frame(maxWidth: .infinity)
                .frame(minHeight: 56)
                .background(color)
                .foregroundStyle(Color.white)
                .cornerRadius(12)
                .padding(.horizontal, 45)
        } else {
            Button {
                action()
            } label: {
                Text(LocalizedStringKey(text))
                    .fredokaFont(size: 20, font: .medium)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 56)
                    .background(color)
                    .foregroundStyle(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 45)
            }
        }

    }
}

#Preview {
    MainButtonView(text: "next") {
        //
    }
}
