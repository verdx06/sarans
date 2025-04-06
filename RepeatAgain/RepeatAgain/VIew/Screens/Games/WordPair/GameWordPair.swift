//
//  GameWordPair.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

struct WordPair {
    let word: String
    let transcription: String
    let answer: String
    let failedAnswer: [String]
}

struct GameWordPair: View {
    
    @State var isSelect = ""
    @State var isSelected = ""
    @State var vm = GameWordPairViewModel()
    
    var body: some View {
        VStack {
            
            if let current = vm.currentPair {
                Text(current.answer)
                Text(current.transcription)
                ForEach(vm.answers, id: \.self) { word in
                    Button {
                        isSelect = word
                    } label: {
                        Text(word)
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .background(getColorForButton(word))
                            .padding(.horizontal)
                    }

                }
            }
            if isSelected.isEmpty {
                
                MainButtonView(text: "Choose") {
                    if !isSelect.isEmpty {
                        isSelected = isSelect
                    }
                }
            } else {
                MainButtonView(text: "Next") {
                    isSelected = ""
                    vm.startGame()
                }
            }

            
        }.headerForGame(text: "Word practice") {
            //
        }
    }
    
    func getColorForButton(_ word: String) -> Color {
        if !isSelected.isEmpty {
            if word == vm.currentPair?.answer {
                return .green
            }
            else if isSelected == word {
                return .hexF76400
            }
            else {
                return .hexE5E5E5
            }
        } else {
            return  isSelect == word ? .hex5B7BFE : .hexE5E5E5
        }
    }
}

#Preview {
    GameWordPair()
}
