//
//  OnboardingViewModel.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    
    var queue: [QueueModel] = Constants.queue
    @Published var currentQueue: QueueModel?
    @Published var isNavigate: Bool = false
    
    init() {
        if let lastwatched = UserDefaults.standard.string(forKey: UserKey.lastwatched.rawValue) {
            if let _ = queue.first(where: { $0.id == lastwatched }) {
                if let index = queue.firstIndex(where: { $0.id == lastwatched }) {
                    queue.removeFirst(index)
                }
            }
        }
        next()
    }
    
    func next() {
        guard !queue.isEmpty else {
            isNavigate = true
            save("4")
            return
        }
        
        let index = queue.removeFirst()
        currentQueue = index
        save(index.id)
        
    }
    
    func save(_ id: String) {
        UserDefaults.standard.set(id, forKey: UserKey.lastwatched.rawValue)
    }
    
    func skip() {
        queue.removeAll()
        UserDefaults.standard.set("4", forKey: UserKey.lastwatched.rawValue)
    }
    
    
}
