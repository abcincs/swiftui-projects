//
//  GridStackView.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 03/03/2021.
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
    public func indexAt(_ row: Int, _ column: Int, colCount: Int = 3) -> Int {
        return  row * colCount + column
    }
}

struct GridVStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            ForEach(0 ..< columns, id: \.self) { row in
                VStack(spacing: 15) {
                    ForEach(0 ..< self.rows, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

extension GridVStack {
    public func indexAt(_ row: Int, _ column: Int, rowCount: Int = 3) -> Int {
        return  row * rowCount + column
    }
}
