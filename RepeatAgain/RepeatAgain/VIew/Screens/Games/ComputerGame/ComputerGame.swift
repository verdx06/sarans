//
//  ComputerGame.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 07.04.2025.
//

import SwiftUI

struct ComputerGame: View {
    
    @State var isSelect = ""
    @State var isSelected = ""
    @State var isComputerAnswer = ""
    @ObservedObject var vm = GameWordPairViewModel()
    
    var body: some View {
        VStack {
            if let current = vm.currentPair {
                Text(current.answer)
                Text(current.transcription)
                ForEach(vm.answers, id: \.self) { word in
                    ZStack {
                        Button {
                            if isSelected.isEmpty {
                                isSelect = word
                            }
                        } label: {
                            Text(word)
                                .foregroundStyle(Color.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 70)
                                .background(getColorForButton(word))
                                .padding(.horizontal)
                        }
                        
                        HStack {
                            if isSelected == word && isComputerAnswer != word{
                                Text("You")
                            }
                            else if isComputerAnswer == word && isSelected != word{
                                Text("P2")
                            }
                            if isSelected == word && isComputerAnswer == word {
                                Text("You")
                            }
                            Spacer()
                            if isSelected == word && isComputerAnswer == word {
                                Text("P2")
                            }
                        }.padding(.horizontal, 30)
                        
                    }
                    
                    
                }
                
                if isSelected.isEmpty {
                    MainButtonView(text: "Choose") {
                        if !isSelect.isEmpty {
                            isSelected = isSelect
                            computerAnswer(answer: current.answer, wrongAnswer: current.failedAnswer)
                        }
                    }
                } else {
                    MainButtonView(text: "Next") {
                        isSelected = ""
                        isSelect = ""
                        isComputerAnswer = ""
                        vm.startGame()
                    }
                }
            }
        }.headerForGame(text: "Word practice") {
            //
        }
    }
    
    func getColorForButton(_ word: String) -> Color {
        guard let correctAnswer = vm.currentPair?.answer else { return .hexE5E5E5 }
        
        if !isSelected.isEmpty {
            // Если это правильный ответ
            if word == correctAnswer {
                // Если и игрок, и компьютер выбрали правильно → зелёный
                if isSelected == word && isComputerAnswer == word {
                    return .green
                }
                // Если только игрок выбрал правильно → зелёный (или можно другой цвет)
                else if isSelected == word {
                    return .green
                }
                // Если только компьютер выбрал правильно → зелёный
                else if isComputerAnswer == word {
                    return .green
                }
                // Правильный ответ, но его никто не выбрал → розовый
                else {
                    return .hexE5E5E5
                }
            }
            // Если это неправильный ответ
            else {
                // Если игрок выбрал этот вариант → красный
                if isSelected == word {
                    return .red
                }
                // Если компьютер выбрал этот вариант → красный
                else if isComputerAnswer == word {
                    return .red
                }
                // Невыбранные неправильные варианты → серый
                else {
                    return .hexE5E5E5
                }
            }
        } else {
            // До выбора: текущий выбор игрока → синий, остальные → серый
            return isSelect == word ? .hex5B7BFE : .hexE5E5E5
        }
    }
    
    func computerAnswer(answer: String, wrongAnswer: [String]) {
        let random = Int.random(in: 1...100)
        print(random)
        if random <= 20 {
            isComputerAnswer = answer
        } else {
            isComputerAnswer = wrongAnswer.randomElement() ?? ""
        }
    }
}

#Preview {
    ComputerGame()
}
