//
//  View.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 31.03.2025.
//

import Foundation
import SwiftUI

extension View {
    
    func fredokaFont(size: CGFloat, font: Font.Weight = .regular) -> some View {
        
        switch font {
        case .bold:
            self
                .font(.custom("Fredoka-Bold", size: size))
        case .medium:
            self
                .font(.custom("Fredoka-Medium", size: size))
        case .light:
            self
                .font(.custom("Fredoka-Light", size: size))
        case .semibold:
            self
                .font(.custom("Fredoka-SemiBold", size: size))
        
        default:
            self
                .font(.custom("Fredoka-Regular", size: size))
        }
        
    }
    
    func header(text: String, action: (()->Void)? = nil) -> some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 102)
                    .foregroundStyle(.hex410FA3)
                HStack {
                    if let action {
                        Button {
                            action()
                        } label: {
                            Image("back")
                        }
                    }
                    Spacer()
                    Text(text)
                        .fredokaFont(size: 17, font: .semibold)
                        .foregroundStyle(.white)
                    Spacer()
                    if let action {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.hex410FA3)
                    }
                }.padding(.top, 40)
                    .padding(.horizontal)
            }
            Spacer()
            self
            Spacer()
        }.edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden()
    }
    
    func headerForGame(text: String, action: (()->Void)? = nil) -> some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 92)
                    .foregroundStyle(.hex410FA3)
                HStack {
                    Button {
                        if let action {
                            action()
                        }
                    } label: {
                        Image("backgame")
                    }.padding(.horizontal, 23)

                    Text(text)
                        .fredokaFont(size: 22, font: .medium)
                        .foregroundStyle(.white)
                    Spacer()
                }
                    .padding(.top, 24)
            }
            Spacer()
            self
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
    
}
