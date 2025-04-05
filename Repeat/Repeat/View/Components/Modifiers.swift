//
//  Modifiers.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 01.04.2025.
//

import Foundation
import SwiftUI

struct NetworkModifier: ViewModifier {
    
    @Binding var isConnect: Bool
    
    func body(content: Content) -> some View {
        content
            .onReceive(NetworkModel.instance.$isConnect) { value in
                if !value {
                    isConnect = true
                }
            }
            .fullScreenCover(isPresented: $isConnect) {
                NetworkView()
            }
    }
    
}
