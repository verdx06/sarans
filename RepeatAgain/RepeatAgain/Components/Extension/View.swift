//
//  View.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import Foundation
import SwiftUI

extension View {
    
    func fredokaFont(size: CGFloat, font: Font.Weight = .regular ) -> some View {
        switch font {
        case .bold:
            self
                .font(.custom("Fredoka-Bold", size: size))
        case .medium:
            self
                .font(.custom("Fredoka-Medium", size: size))
        case .semibold:
            self
                .font(.custom("Fredoka-SemiBold", size: size))
        default :
            self
                .font(.custom("Fredoka-Regular", size: size))
        }
    }
    
    func header(text: String, action: (()->Void)? = nil ) -> some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 102)
                    .foregroundStyle(Color.hex410FA3)
                HStack {
                    if let action = action {
                        Button {
                            action()
                        } label: {
                            Image("back")
                        }
                    }

                    Spacer()
                    Text(text)
                        .fredokaFont(size: 17, font: .medium)
                        .foregroundStyle(Color.white)
                    Spacer()
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.hex410FA3)
                }.padding(.top, 40)
                    .padding(.horizontal)
            }
            Spacer()
            self
            Spacer()
        }.edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden()
    }
    
    
}
