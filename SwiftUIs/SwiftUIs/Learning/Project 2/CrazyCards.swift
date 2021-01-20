//
//  CrazyCards.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/28/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct CrazyCards: View {
//    var fillColor = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<10)   { num  in
                    VStack {
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
                                .frame(width: 150, height: 150)
                                .padding()
                            
                                
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX)), axis: (0,1,0))
                            //                                .rotationEffect(.degrees(-Double(geo.frame(in: .global).minX)))
                        }
                    }
                    .frame(width: 50)
                }
                
            }
            .padding(100)
        }
    }
}


struct CrazyCards_Previews: PreviewProvider {
    static var previews: some View {
        CrazyCards()
    }
}
