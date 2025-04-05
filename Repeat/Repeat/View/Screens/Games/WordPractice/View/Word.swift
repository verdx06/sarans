//
//  Word.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct Word: View {
    
    let isColor: Color
    let word: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 12)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .foregroundStyle(isColor)
            if isColor == .hex5B7BFE || isColor == .hexF76400 {
                Text(word)
                    .foregroundStyle(Color.white)
                    .fredokaFont(size: 20, font: .medium)
            } else {
                Text(word)
                    .foregroundStyle(Color.black)
                    .fredokaFont(size: 20, font: .medium)
            }
            
        }.padding(.horizontal, 45)
    }
}


