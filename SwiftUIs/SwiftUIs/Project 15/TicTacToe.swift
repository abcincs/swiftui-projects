//
//  TicTacToe.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/17/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var hasbeenSelected = false
    static let example1 = Item(hasbeenSelected: false)
    static let example2 = Item(hasbeenSelected: true)
}

struct TicTacToe: View {
    @State private var hasStarted = false
    @State private var isHuman = false
    @State private var items  = [Item](repeating: .example1, count: 2) + [Item](repeating: .example2, count: 5)
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            GridStack(rows: 3, columns: 3) { row, column in
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .frame(width: 100, height: 100)
                        .background(self.items[row+column].hasbeenSelected ? Color.red : Color.clear)
                        .onTapGesture {
                            self.items[row+column].hasbeenSelected.toggle()
                    }
                    .onAppear{
                        print("The solum", row)
                    }
                    
                    Circle()
                        .fill(!self.hasStarted  ? Color.clear : (self.isHuman ? Color.blue : Color.black))
                        .frame(width: 50, height: 50)
                }
                
            }
        }
    }
}

struct TicTacToe_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToe()
    }
}
