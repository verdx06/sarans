//
//  Steps.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import Foundation
import SwiftUI

struct Steps: View {
    
    let steps: String
    
    var body: some View {
        HStack {
            if let steps = Int(steps) {
                ForEach(1...3, id: \.self) { index in
                    Image(index == steps ? "ActiveStep":"NonActiveStep")
                }
            }
        }
    }
}

#Preview {
    Steps(steps: "1")
}
