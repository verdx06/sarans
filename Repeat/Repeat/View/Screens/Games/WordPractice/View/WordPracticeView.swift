//
//  WordPracticeView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct WordPracticeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var gameViewModel = WordPracticeViewModel()
    
    var body: some View {
        VStack {
            if let currentWordPair = gameViewModel.currentWordPair {
                Text(currentWordPair.word)
                    .fredokaFont(size: 28, font: .bold)
                    .padding(.top, 35)
                Text(currentWordPair.transcription)
                    .fredokaFont(size: 17)
                    .padding(.bottom, 35)
                
                ForEach(gameViewModel.answers, id: \.self) { answer in
                    Button {
                        gameViewModel.isSelect = answer
                    } label: {
                        Word(isColor: gameViewModel.getColorForButton(answer), word: answer)
                    }

                }
                
            }
            
            Spacer()
            if !gameViewModel.isSelectedWord.isEmpty {
                MainButtonView(text: "Next") {
                    gameViewModel.startGame()
                }
            } else {
                MainButtonView(text: "Check") {
                    withAnimation {
                        gameViewModel.isSelectedWord = gameViewModel.isSelect // Фиксируем выбранное слово при нажатии
                    }
                }
            }
        }
        .onAppear(perform: {
            gameViewModel.startGame()
        })
        .headerForGame(text: "Word practice") {
            dismiss()
        }
    }
}

#Preview {
    WordPracticeView()
}
