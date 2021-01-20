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
    var isHuman = false
    
    static let example = Item(hasbeenSelected: false, isHuman: false)
}

struct TicTacToe: View {
    @State private var hasStarted = false
    @State private var isHuman = false
    @State var row = 3
    @State var column = 3
    @State private var items  = [Item](repeating: .example, count: 9)
    @State private var showAlert = false
    var body: some View {
        VStack {
            Text("")
            GridStack(rows: 3, columns: 3) { row, column in
                ZStack {
                    Rectangle()
                        .stroke(Color(.label), lineWidth: 3)
                        .frame(width: 100, height: 100)
                        .background(Color(.systemBackground))
                        .onTapGesture {
                            self.items[self.index(at: row, and: column)].hasbeenSelected.toggle()
                            self.items[self.index(at: row, and: column)].isHuman = self.isHuman
                            self.isHuman.toggle()
                            
                            let humans =  self.items.filter{$0.isHuman && $0.hasbeenSelected}.count
                            let pcs = self.items.filter({ !$0.isHuman && $0.hasbeenSelected}).count
                            
                            print("Les Humans", humans, "Les PCs", pcs)
                            
                            if self.isWinner().0 {
                                self.showAlert = true
                                print(self.isWinner().1)
                            }
                    }
                    
                    Image(self.items[self.index(at: row, and: column)].hasbeenSelected ? (self.items[self.index(at: row, and: column)].isHuman ? "human" : "cpu") : "circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .allowsHitTesting(false)
                }
                
            }
            Button(action: {
                self.items = [Item](repeating: .example, count: 9)
                
            }) {
                Text("Reset")
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.label), Color(.red)]), startPoint: .bottomLeading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .clipShape(Capsule())
            }
            .animation(.spring())
            .transition(.scale(scale: 0.8, anchor: .center))
            .opacity(self.items.map({ $0.hasbeenSelected }).allSatisfy({ $0 }) ? 1 : 0)
        }
        .alert(isPresented:$showAlert) {
            Alert(title: Text("Winner"), message: Text(self.isWinner().1), dismissButton: .default(Text("Dismiss")){
               self.items = [Item](repeating: .example, count: 9)
                })
        }
    }
    
    func index(at row: Int, and column: Int) -> Int {
        return (((self.column * (row + 1)) + column + 1) - self.row)  - 1
    }
    
    func isWinner() -> (Bool, String) {
        let case1  = [self.items[0],  self.items[1], self.items[2]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case2  = [self.items[3],  self.items[4], self.items[5]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case3  = [self.items[6],  self.items[7], self.items[8]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case4  = [self.items[0],  self.items[3], self.items[6]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case5  = [self.items[1],  self.items[4], self.items[7]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case6  = [self.items[2],  self.items[5], self.items[8]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case7  = [self.items[0],  self.items[4], self.items[8]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        let case8  = [self.items[2],  self.items[4], self.items[6]].allSatisfy({ $0.isHuman && $0.hasbeenSelected })
        
        let pcase1  = [self.items[0],  self.items[1], self.items[2]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase2  = [self.items[3],  self.items[4], self.items[5]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase3  = [self.items[6],  self.items[7], self.items[8]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase4  = [self.items[0],  self.items[3], self.items[6]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase5  = [self.items[1],  self.items[4], self.items[7]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase6  = [self.items[2],  self.items[5], self.items[8]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase7  = [self.items[0],  self.items[4], self.items[8]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
        let pcase8  = [self.items[2],  self.items[4], self.items[6]].allSatisfy({ !$0.isHuman && $0.hasbeenSelected })
          
        
        if case1 || case2 || case3 || case4 || case5 || case6 || case7 || case8 {
            return (true, "Check won the game!!!")
        } else if pcase1 || pcase2 || pcase3 || pcase4 || pcase5 || pcase6 || pcase7 || pcase8 {
             return (true, "Cross won the game!!!")
        } else {
             return (false, "No Winner!!")
        }
    }
}

struct TicTacToe_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToe()
    }
}


extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue},
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
        })
    }
}
