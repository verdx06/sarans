//
//  AdaptiveModifier.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 05.04.2025.
//

import SwiftUI

struct AdaptiveTextModifier: ViewModifier {
    
    @Environment(\.horizontalSizeClass) var size
    let fontSize: CGFloat
    let fontWeight: Font.Weight?
    
    func body(content: Content) -> some View {
        content
            .fredokaFont(size: size == .regular ? fontSize*Constants.iPadSize : fontSize , font: fontWeight ?? .regular)
    }
    
}
