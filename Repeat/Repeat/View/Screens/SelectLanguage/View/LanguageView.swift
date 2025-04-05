//
//  LanguageView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct LanguageView: View {
    
    let text: String
    let active: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(active ? Color.hexF76400 : Color.hexFFF6EB)
                .frame(maxWidth: .infinity)
                .frame(height: 67)
            HStack {
                Text(text)
                    .foregroundStyle(Color.black)
                    .fredokaFont(size: 22, font: .medium)
                    .padding(.horizontal)
                Spacer()
            }
        }.padding(.horizontal, 45)
    }
}

#Preview {
    LanguageView(text: "Russian", active: false)
}
