//
//  CardTextView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/16/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI
import UIKit


struct CardTextView: UIViewRepresentable {
    var previousTextFieldContent: String = ""
    var previousSelection: UITextRange? = UITextRange()
    
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        
        let myTextView = UITextField()
        myTextView.delegate = context.coordinator
        
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = UIColor.black
        myTextView.textColor = .white
        myTextView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return myTextView
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
    }
    
    class Coordinator : NSObject, UITextFieldDelegate {
        
        var parent: CardTextView
        
        init(_ uiTextView: CardTextView) {
            self.parent = uiTextView
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.addTarget(self, action: #selector(reformatAsCardNumber), for: .editingChanged)
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            parent.previousTextFieldContent = textField.text ?? "";
            parent.previousSelection = textField.selectedTextRange;
            return true
        }
        
        func removeNonDigits(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
            var digitsOnlyString = ""
            let originalCursorPosition = cursorPosition

            for i in Swift.stride(from: 0, to: string.count, by: 1) {
                let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
                if characterToAdd >= "0" && characterToAdd <= "9" {
                    digitsOnlyString.append(characterToAdd)
                }
                else if i < originalCursorPosition {
                    cursorPosition -= 1
                }
            }

            return digitsOnlyString
        }
        
        @objc func reformatAsCardNumber(textField: UITextField) {
            var targetCursorPosition = 0
            if let startPosition = textField.selectedTextRange?.start {
                targetCursorPosition = textField.offset(from: textField.beginningOfDocument, to: startPosition)
            }

            var cardNumberWithoutSpaces = ""
            if let text = textField.text {
                cardNumberWithoutSpaces = self.removeNonDigits(string: text, andPreserveCursorPosition: &targetCursorPosition)
            }

            if cardNumberWithoutSpaces.count > 19 {
                textField.text = parent.previousTextFieldContent
                textField.selectedTextRange = parent.previousSelection
                return
            }

            let cardNumberWithSpaces = self.insertCreditCardSpaces(cardNumberWithoutSpaces, preserveCursorPosition: &targetCursorPosition)
            textField.text = cardNumberWithSpaces
            parent.text = cardNumberWithSpaces
            //here is to change the text data

            if let targetPosition = textField.position(from: textField.beginningOfDocument, offset: targetCursorPosition) {
                textField.selectedTextRange = textField.textRange(from: targetPosition, to: targetPosition)
            }
        }
        
        func insertCreditCardSpaces(_ string: String, preserveCursorPosition cursorPosition: inout Int) -> String {
            // Mapping of card prefix to pattern is taken from
            // https://baymard.com/checkout-usability/credit-card-patterns

            // UATP cards have 4-5-6 (XXXX-XXXXX-XXXXXX) format
            let is456 = string.hasPrefix("1")

            // These prefixes reliably indicate either a 4-6-5 or 4-6-4 card. We treat all these
            // as 4-6-5-4 to err on the side of always letting the user type more digits.
            let is465 = [
                // Amex
                "34", "37",

                // Diners Club
                "300", "301", "302", "303", "304", "305", "309", "36", "38", "39"
            ].contains { string.hasPrefix($0) }

            // In all other cases, assume 4-4-4-4-3.
            // This won't always be correct; for instance, Maestro has 4-4-5 cards according
            // to https://baymard.com/checkout-usability/credit-card-patterns, but I don't
            // know what prefixes identify particular formats.
            let is4444 = !(is456 || is465)

            var stringWithAddedSpaces = ""
            let cursorPositionInSpacelessString = cursorPosition

            for i in 0..<string.count {
                let needs465Spacing = (is465 && (i == 4 || i == 10 || i == 15))
                let needs456Spacing = (is456 && (i == 4 || i == 9 || i == 15))
                let needs4444Spacing = (is4444 && i > 0 && (i % 4) == 0)

                if needs465Spacing || needs456Spacing || needs4444Spacing {
                    stringWithAddedSpaces.append(" ")

                    if i < cursorPositionInSpacelessString {
                        cursorPosition += 1
                    }
                }

                let characterToAdd = string[string.index(string.startIndex, offsetBy:i)]
                stringWithAddedSpaces.append(characterToAdd)
            }

            return stringWithAddedSpaces
        }
        
        
        
    }
}
