//
//  CrazyScroll.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/7/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyScroll: View {
    @State private var offSet = CGSize.zero
    @State private var cardOffSet = CGSize(width: 0, height: 0)
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                VStack {
                    GridStack(rows: 3, columns: 2) { row, column in
                        CustomView()
                            .padding(.vertical)
                            .frame(width: geo.size.width / 2 - 69)
                            .background(Color(red: 0.344, green: 0.378, blue: 0.859))
                            .animation(.spring())
                            .offset(x: self.cardOffSet.width / CGFloat(row + 1))
                            .onTapGesture {
                                print(self.offSet.width/CGFloat(row + 1))
                        }
                    }
                    
                }
                .overlay(
                    Rectangle()
                        .fill(Color.blue.opacity(0.1))
                        .offset(x: self.offSet.width)
                        .gesture(
                            DragGesture()
                                .onChanged{ value in
                                    withAnimation(.spring()) {
                                        self.offSet = value.translation
                                        self.cardOffSet.width = self.offSet.width * 3
                                    }
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    if abs(value.translation.width) > 150 {
                                        let trans = value.translation.width > 0 ? abs(value.translation.width) :  value.translation.width
                                        self.offSet.width = trans
                                            * geo.size.width/1.4
                                    } else {
                                        self.offSet.width = .zero
                                    }
                                    self.cardOffSet.width = self.offSet.width * 3
                                }
                                
                            }
                    )
                )
                
                Spacer()
                ZStack {
                    ButtonBackGround()
                        .frame(width: 80, height: 80)
                        .scaleEffect(0.7)
                        .overlay(
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                    )
                        .rotationEffect(.degrees(Double(self.offSet.width)))
                        .offset(x: self.offSet.width)
                }
                
            }
        }
        .background(Color(red: 0.2, green: 0.237, blue: 0.626).edgesIgnoringSafeArea(.all))
    }
}

struct CrazyScroll_Previews: PreviewProvider {
    static var previews: some View {
        CrazyScroll()
    }
}

struct CustomView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Capsule()
                .fill(Color.white.opacity(0.7))
                .frame(width: 60, height: 20)
            Capsule()
                .fill(Color.white.opacity(0.7))
                .frame(width: 90, height: 20)
            Capsule()
                .fill(Color.white.opacity(0.7))
                .frame(width: 70, height: 20)
            Capsule()
                .fill(Color.white.opacity(0.7))
                .frame(width: 80, height: 20)
        }
        
    }
}
