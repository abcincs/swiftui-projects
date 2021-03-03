//
//  Extension+View.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 02/03/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    /// Ignore keyboard for a view
    /// - Returns: A View that ingores the appearance of the keyboard
    func viewIgnoreKeyboard() -> some View {
        return Group {
            if #available(iOS 14.0, *) {
                self.ignoresSafeArea(.keyboard)
            } else {
                self
            }
        }
    }
}
