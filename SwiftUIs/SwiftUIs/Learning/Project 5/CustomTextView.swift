//
//  CustomTextView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/4/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct CustomTextView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var textRange: Int
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textColor = .brown
        textView.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        
        return UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        uiView.textColor = .brown
        uiView.textAlignment = .justified
        uiView.isEditable = false
        uiView.isSelectable = false
        uiView.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 0.2) {
            uiView.scrollRangeToVisible(NSRange(location: 220, length: textRange))
        }
        uiView.text = text
    }
}
