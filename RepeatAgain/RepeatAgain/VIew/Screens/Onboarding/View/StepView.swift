//
//  StepView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct StepView: View {
    
    let queue: String
    @Environment(\.colorScheme) var theme
    
    var body: some View {
        HStack {
            ForEach(1...3, id: \.self) { item in
                Image(Int(queue) == item ? "stepActivity" :  theme == .dark ? "stepdark" : "step")
            }
        }
    }
}

#Preview {
    StepView(queue: "1")
}
