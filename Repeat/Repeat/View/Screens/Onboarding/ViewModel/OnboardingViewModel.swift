//
//  OnboardingViewModel.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import Foundation

extension OnboardingView {
    class ViewModel: ObservableObject {
        
        @Published var currentQueue: QueueModel?
        @Published var buttonTitle: String = ""
        @Published var isNavigate: Bool = false
        @Published var lastkey: String?
        var queue: [QueueModel] = Constants.queue
        
        init(currentQueue: QueueModel? = nil, customqueue: [QueueModel]? = nil, lastkey: String? = nil) {
            self.currentQueue = currentQueue
            self.queue = customqueue ?? queue
            loadLastScreen()
            next()
        }
        
        func next() {
            guard !queue.isEmpty else  {
                isNavigate = true
                save("4")
                return
            }
            
            let index = queue.removeFirst()
            
            switch index.id {
            case "1" : buttonTitle = "Next"
            case "2" : buttonTitle = "More"
                
            default:
                buttonTitle = "Choose a language"
            }
            
            currentQueue = index
            
            save(index.id)
            
        }
        
        func skip() {
            isNavigate = true
            queue.removeAll()
            save("4")
        }
        
        func save(_ id: String) {
            UserDefaults.standard.set(id, forKey: UserKey.lastwatched.rawValue)
        }
        
        func loadLastScreen() {
            if let lastWatched = UserDefaults.standard.string(forKey: lastkey ?? UserKey.lastwatched.rawValue) {
                if let _ = queue.first(where: { $0.id == lastWatched }) {
                    if let index = queue.firstIndex(where: { $0.id == lastWatched }) {
                        queue.removeFirst(index)
                    }
                }
            }
        }
        
    }
}
