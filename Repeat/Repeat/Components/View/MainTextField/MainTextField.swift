//
//  MainTextField.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI

struct MainTextField: View {

    let title: String
    let example: String
    @Binding var text: String
    
    let security: Bool
    @State var eye: Bool
    
    init(title: String, example: String, text: Binding<String>, security: Bool = false, eye: Bool = false) {
        self.title = title
        self.example = example
        self._text = text
        self.security = security
        self.eye = eye
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(LocalizedStringKey(title))
                    .fredokaFont(size: 15)
                    .padding(.top)
                Spacer()
            }
            ZStack {
                HStack(spacing: 0){
                    if text.isEmpty {
                        if security {
                            ForEach(0..<7, id: \.self) { _ in
                                Circle()
                                    .frame(width: 6, height: 6)
                                    .foregroundStyle(Color.hex65687280)
                                    .padding(.horizontal, 2)
                            }
                        } else {
                            Text(example)
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .fredokaFont(size: 15)
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
            }
        }.padding(.horizontal, 45)
    }
}
