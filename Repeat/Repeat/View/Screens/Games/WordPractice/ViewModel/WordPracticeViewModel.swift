//
//  WordPracticeViewModel.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 03.04.2025.
//

import Foundation
import SwiftUI


class WordPracticeViewModel: ObservableObject {
    
    @Published var wordPairs: [WordPair] = [
        WordPair(word: "gardener", transcription: "[ 'gɑ:dnə ]", correctTranslation: "Садовник", wrongTranslations: ["Муха", "Гладиолус", "Собака"]),
        
        WordPair(word: "butterfly", transcription: "[ 'bʌtərflaɪ ]", correctTranslation: "Бабочка", wrongTranslations: ["Стол", "Облако", "Карандаш"]),
        
        WordPair(word: "harmony", transcription: "[ 'hɑːrməni ]", correctTranslation: "Гармония", wrongTranslations: ["Хаос", "Шум", "Раздор"]),
        
        WordPair(word: "whisper", transcription: "[ 'wɪspər ]", correctTranslation: "Шёпот", wrongTranslations: ["Крик", "Гром", "Тишина"]),
        
        WordPair(word: "thunder", transcription: "[ 'θʌndər ]", correctTranslation: "Гром", wrongTranslations: ["Молния", "Дождь", "Ветер"]),
        
        WordPair(word: "breeze", transcription: "[ briːz ]", correctTranslation: "Лёгкий ветер", wrongTranslations: ["Ураган", "Штиль", "Тайфун"]),
        
        WordPair(word: "drizzle", transcription: "[ 'drɪzl ]", correctTranslation: "Морось", wrongTranslations: ["Ливень", "Град", "Снег"]),
        
        WordPair(word: "blossom", transcription: "[ 'blɒsəm ]", correctTranslation: "Цветение", wrongTranslations: ["Увядание", "Рост", "Почка"]),
        
        WordPair(word: "twilight", transcription: "[ 'twaɪlaɪt ]", correctTranslation: "Сумерки", wrongTranslations: ["Рассвет", "Полдень", "Ночь"]),
        
        WordPair(word: "meadow", transcription: "[ 'medoʊ ]", correctTranslation: "Луг", wrongTranslations: ["Лес", "Поле", "Болото"]),
        
        WordPair(word: "cinnamon", transcription: "[ 'sɪnəmən ]", correctTranslation: "Корица", wrongTranslations: ["Ваниль", "Имбирь", "Кардамон"])
    ]
    
    @Published  var isSelect: String = ""
    @Published  var isSelectedWord: String = ""
    @Published var answers: [String] = []
    @Published var currentWordPair: WordPair?
    
    func getColorForButton(_ word: String) -> Color {
        if !isSelectedWord.isEmpty {
            if word == currentWordPair?.correctTranslation {
                return .hex5BA890
            }
            else if isSelectedWord == word {
                return .hexF76400
            }
            else {
                return .hexE5E5E5
            }
        } else {
            return  isSelect == word ? .hex5B7BFE : .hexE5E5E5
        }
    }
    
    func startGame() {
        isSelectedWord = ""
        currentWordPair = wordPairs.removeFirst()
        if let currentWordPair = currentWordPair {
            answers = (currentWordPair.wrongTranslations + [currentWordPair.correctTranslation]).shuffled()
        }
    }
    
}
