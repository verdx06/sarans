//
//  NetworkView.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 01.04.2025.
//

import SwiftUI

struct NetworkView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("NotInternet")
            Text("no_internet")
                .multilineTextAlignment(.center)
                .fredokaFont(size: 30, font: .semibold)
                .padding()
            
            Spacer()
            Spacer()
            MainButtonView(text: "check_again") {
                if NetworkModel.instance.isConnect {
                    dismiss()
                }
            }
        }.header(text: "")
    }
    
}

#Preview {
    NetworkView()
}
