//
//  RepeatTests.swift
//  RepeatTests
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import XCTest
@testable import Repeat

final class RepeatTests: XCTestCase {
    
    let queue: [QueueModel] = [
        .init(id: "1", text: "Confidence in your words", subtext: "With conversation-based learning,\nyou'll be talking from lesson one", image: "onboarding1"),
        .init(id: "2", text: "Take your time to learn", subtext: "Develop a habit of learning and\nmake it a part of your daily routine", image: "onboarding2"),
        .init(id: "3", text: "The lessons you need to learn", subtext: "Using a variety of learning styles to learn\nand retain", image: "onboarding3")
    ]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCorrectQueue() {
        
        let vm = OnboardingView.ViewModel(customqueue: queue, lastkey: "0")
        var count = vm.queue.count
        
        while true {
            guard !vm.queue.isEmpty else { return }
            guard count > 0 else { XCTFail(); return }
            guard let firstItem = vm.queue.first else { XCTFail(); return }
            
            let currentItem = vm.currentQueue
            
            XCTAssertNotEqual(firstItem.id, currentItem?.id)
            
            vm.next()
            count -= 1
            
            let newCurrentItem = vm.currentQueue
            
            XCTAssertEqual(newCurrentItem?.id, firstItem.id)
            
        }
        
    }
    
    func testCorrectGetItemFromQueue() {
        
        let vm = OnboardingView.ViewModel(customqueue: queue, lastkey: "0")
        var count = vm.queue.count
        
        while true {
            guard !vm.queue.isEmpty else { return }
            guard count > 0 else { XCTFail(); return }
            
            let currentCount = vm.queue.count
            
            vm.next()
            count -= 1
            
            let newCurrentCount = vm.queue.count
            
            let result = currentCount - newCurrentCount
            
            XCTAssertEqual(result, 1)
            
        }
        
    }
    
    func testCorrectTextOnButton() {
        
        let vm = OnboardingView.ViewModel(customqueue: queue, lastkey: "0")
        var count = vm.queue.count
        
        while true {
            guard !vm.queue.isEmpty else { return }
            guard count > 0 else { XCTFail(); return }
            
            let firstButton = vm.buttonTitle
            
            vm.next()
            count -= 1
            
            let newButton = vm.buttonTitle
            
            XCTAssertNotEqual(firstButton, newButton)
            
            
        }
        
    }

}
