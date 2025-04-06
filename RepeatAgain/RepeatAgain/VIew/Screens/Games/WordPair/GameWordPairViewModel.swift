//
//  GameWordPair.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

class GameWordPairViewModel: ObservableObject {
    
    @Published var currentPair: WordPair?
    @Published var answers: [String] = []
    
    @Published var words: [WordPair] = [
        .init(word: "gardener", transcription: "[ 'gɑːdnə ]", answer: "Садовник", failedAnswer: ["Муха", "Гладиолус", "Собака"]),
        .init(word: "Стол", transcription: "[ stol ]", answer: "Table", failedAnswer: ["Chair", "Book", "Pen"]),
        .init(word: "apple", transcription: "[ 'æpl ]", answer: "Яблоко", failedAnswer: ["Груша", "Апельсин", "Банан"]),
        .init(word: "Кошка", transcription: "[ 'koʂkə ]", answer: "Cat", failedAnswer: ["Dog", "Bird", "Fish"]),
        .init(word: "sun", transcription: "[ sʌn ]", answer: "Солнце", failedAnswer: ["Луна", "Звезда", "Дождь"]),
        .init(word: "Молоко", transcription: "[ məɫɐ'ko ]", answer: "Milk", failedAnswer: ["Water", "Juice", "Tea"]),
        .init(word: "house", transcription: "[ haʊs ]", answer: "Дом", failedAnswer: ["Квартира", "Школа", "Магазин"]),
        .init(word: "Ручка", transcription: "[ 'rut͡ɕkə ]", answer: "Pen", failedAnswer: ["Pencil", "Book", "Eraser"])
    ]
    
    init() {
        startGame()
    }
    
    func startGame() {
        currentPair = words.removeFirst()
        if let currentPair = currentPair {
            answers = (currentPair.failedAnswer + [currentPair.answer])
        }
    }
    
}
