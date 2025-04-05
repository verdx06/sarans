//
//  PDFKitViewModel.swift
//  Repeat
//
//  Created by Виталий Багаутдинов on 02.04.2025.
//

import SwiftUI
import Foundation
import PDFKit

struct PDFKitView: UIViewRepresentable {
    func updateUIView(_ uiView: PDFView, context: Context) {
        //
    }
    
    
    func makeUIView(context: Context) -> PDFView {
        let pdf = PDFView()
        
        if let url = Bundle.main.url(forResource: "document", withExtension: "url") {
            if let document = PDFDocument(url: url) {
                pdf.document = document
            }
        }
        return pdf
    }
    
}

