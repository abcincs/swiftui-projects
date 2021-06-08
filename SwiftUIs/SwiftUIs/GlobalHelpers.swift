//
//  GlobalHelpers.swift
//  clom
//
//  Created by Cédric Bahirwe on 14/05/2021.
//
import Foundation
import SwiftUI



extension Color {
    // MARK: Colors
    static let clearGray = Color(#colorLiteral(red: 0.7098039216, green: 0.7137254902, blue: 0.7176470588, alpha: 1))
    static let clearBlue = Color(#colorLiteral(red: 0.4549019608, green: 0.6509803922, blue: 0.9411764706, alpha: 1))
    static let offWhite = Color(#colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.9215686275, alpha: 1))
    static let darkBlack = Color(#colorLiteral(red: 0.06666666667, green: 0.07058823529, blue: 0.07450980392, alpha: 1))
    static let darkGray = Color(#colorLiteral(red: 0.1607843137, green: 0.1647058824, blue: 0.1882352941, alpha: 1))
    static let darkBlue = Color(#colorLiteral(red: 0.3764705882, green: 0.6823529412, blue: 0.7882352941, alpha: 1))
    static let darkPink = Color(#colorLiteral(red: 0.9568627451, green: 0.5176470588, blue: 0.6941176471, alpha: 1))
    static let darkViolet = Color(#colorLiteral(red: 0.8392156863, green: 0.7411764706, blue: 0.9843137255, alpha: 1))
    static let darkGreen = Color(#colorLiteral(red: 0.537254902, green: 0.7529411765, blue: 0.7058823529, alpha: 1))
}

extension UIScreen {
    static let screenSize = main.bounds.size
    static let screenWidth = screenSize.width
    static let screenHeight = screenSize.height
}
