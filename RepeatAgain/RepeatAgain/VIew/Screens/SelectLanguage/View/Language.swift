//
//  Language.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct Language: View {
    
    let language: String
    let activity: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle( activity ? Color.hexF76400 : Color.hexFFF6EB)
                .frame(maxWidth: .infinity)
                .frame(height: 67)
            HStack {
                Text(language)
                    .fredokaFont(size: 22, font: .medium)
                    .padding(.horizontal)
                    .foregroundStyle(Color.black)
                Spacer()
            }
            
        }.padding(.horizontal, 45)
    }
}

#Preview {
    Language(language: "Russian", activity: false)
}
