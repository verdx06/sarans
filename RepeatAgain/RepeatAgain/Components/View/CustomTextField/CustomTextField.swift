//
//  CustomTextField.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    let example: String
    @Binding var text: String
    
    let security: Bool
    @State var eye: Bool = false
    
    init(title: String, example: String, text: Binding<String>, security: Bool = false) {
        self.title = title
        self.example = example
        self._text = text
        self.security = security
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .fredokaFont(size: 15)
            ZStack {
                if security && !eye {
                    SecureField("", text: $text)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(Color.black.opacity(0.05))
                        )
                } else {
                    TextField("", text: $text)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(Color.black.opacity(0.05))
                        )
                }
                HStack(spacing: 4) {
                    if text.isEmpty {
                        if security {
                            ForEach(1...7, id: \.self) { _ in
                                Image("password")
                            }
                        } else {
                            Text(example)
                                .fredokaFont(size: 15)
                                .foregroundStyle(Color.black.opacity(0.5))
                        }
                    }
                    Spacer()
                    if security {
                        Button {
                            eye.toggle()
                        } label: {
                            Image("eye")
                        }
                    }
                }.padding(.horizontal)
            }
        }.padding(.horizontal, 45)
            .padding(.top)
    }
    
}



#Preview {
    CustomTextField(title: "Email", example: "email@String", text: .constant(""))
}
