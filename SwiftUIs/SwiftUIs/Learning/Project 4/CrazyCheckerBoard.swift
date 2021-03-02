//
//  CrazyCheckerBoard.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/2/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyCheckerBoardView: View {
    
    @State private var rows = 10
    @State private var columns = 10
    
    var body: some View {
        CrazyCheckerBoard(rows: rows, columns: columns)
            .fill(LinearGradient(gradient: Gradient(colors: [.black, .red, .black]), startPoint: .top, endPoint: .bottom))
            .frame(width: 250, height: 250)
            .onReceive(Timer.publish(every: 0.5, on: .main, in: .common).autoconnect(), perform: { _ in
                let randomR = Int.random(in: 3...15)
                let randomC = Int.random(in: 4...18)
                withAnimation {
                    rows = randomR
                    columns = randomC
                }
            })
    }
}


fileprivate struct CrazyCheckerBoard: Shape {
    
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
