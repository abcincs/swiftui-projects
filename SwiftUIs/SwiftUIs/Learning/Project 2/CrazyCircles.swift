//
//  CrazyCircles.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/28/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyCircles: View {
    
    let colorsa = Gradient(colors:
        [.red, .yellow, .green, .blue, .purple])
    let colorsb = Gradient(colors:
    [.red, .yellow, .green, .blue, .purple, .red])
    
    let colorsc = Gradient(colors:
    [.red, .yellow, .green, .blue, .purple, .red])
    var body: some View {
        VStack {
            
            HStack {
                Image("all-out-donuts-thumb")
                    .resizable(capInsets: EdgeInsets(top: 0, leading: 20,
                                                     bottom: 20, trailing: 20), resizingMode: .tile)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 200)
                
                Circle()
                    .fill(RadialGradient(gradient: colorsa, center: .center, startRadius: 50, endRadius: 100))
                    .frame(width: 200, height: 200)
            }
            
            HStack {
                Circle()
                    .fill(AngularGradient(gradient: colorsb, center: .center))
                
                
                //                Spacer()
                
                Circle()
                    .strokeBorder(AngularGradient(gradient: colorsc, center: .center, startAngle: .zero, endAngle: .degrees(360)), lineWidth: 50)
            }
            .padding()
        }
        .padding()
    }
}


struct CrazyCircles_Previews: PreviewProvider {
    static var previews: some View {
        CrazyCircles()
    }
}
