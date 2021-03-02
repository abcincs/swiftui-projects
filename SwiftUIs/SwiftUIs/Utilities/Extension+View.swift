//
//  Extension+View.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 02/03/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    var body: some View {
        VStack {
            ForEach(0 ..< self.rows) { row in
                HStack {
                    ForEach(0 ..<  self.columns) { column in
                        self.content(row, column)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
    }
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content ) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}


extension GridStack {
    public func indexFor(_ row: Int, _ column: Int, colCount: Int = 3) -> Int {
        return  row * colCount + column
    }
}

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
