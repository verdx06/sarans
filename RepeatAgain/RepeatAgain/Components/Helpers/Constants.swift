//
//  Constants.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import Foundation

enum Constants {
    static let queue: [QueueModel] = [
        .init(id: "1", text: "Confidence in your words", subtext: "With conversation-based learning,\nyou'll be talking from lesson one", image: "onboarding1", buttonTitle: "Next"),
        .init(id: "2", text: "Take your time to learn", subtext: "Develop a habit of learning and\nmake it a part of your daily routine", image: "onboarding2", buttonTitle: "More"),
        .init(id: "3", text: "The lessons you need to learn", subtext: "Using a variety of learning styles to learn\nand retain", image: "onboarding3", buttonTitle: "Choose a language")
    ]
    
    static let iPadSize = 1.25
    
}
