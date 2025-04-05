//
//  NetworkModel.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 01.04.2025.
//

import Foundation
import Network

class NetworkModel {
    
    @Published var isConnect: Bool = true
    
    static let instance = NetworkModel()
    
    let monitor = NWPathMonitor()
    
    let queue = DispatchQueue(label: "NetworkQueue")
    
    init() {
        monitor.pathUpdateHandler = { path in
            let isConnect = path.status == .satisfied
            
            DispatchQueue.main.async {
                self.isConnect = isConnect
            }
            
        }
        monitor.start(queue: queue)
    }
    
}
