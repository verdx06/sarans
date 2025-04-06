//
//  Games.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

struct Games: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    AnimalsView()
                } label: {
                    Text("animals")
                }

            }
        }
    }
}

#Preview {
    Games()
}
