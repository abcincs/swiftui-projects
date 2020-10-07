//
//  CrazyCheckerBoard.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/2/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyCheckerBoardView: View {
    var body: some View {
        CrazyCheckerBoard(rows: 10, columns: 10)
            .fill(LinearGradient(gradient: Gradient(colors: [.black, .red, .black]), startPoint: .top, endPoint: .bottom))
            .frame(width: 250, height: 250)
    }
}


struct CrazyCheckerBoard: Shape {
    
    let rows: Int
    let columns: Int
    
    func path(in rect: CGRect) -> Path {
        
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        var path = Path()
        
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}


struct CrazyCheckerBoardView_Previews: PreviewProvider {
    static var previews: some View {
        CrazyCheckerBoardView()
    }
}
