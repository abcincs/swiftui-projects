//
//  Project1.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 20/01/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct Project1: View {
    @State var rotate = false
    var body: some View {
        ZStack {
            Image("card1")
                .resizable()
                .frame(width: 300, height: 200)
                .cornerRadius(15)
                .zIndex(!rotate ? 5 : 10)
                .rotation3DEffect(
                    .init(degrees: rotate ?  179 : 0),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            
            Image("card2")
                .resizable()
                .frame(width: 300, height: 200)
                .cornerRadius(15)
                .zIndex(rotate ? 5 : 10)
                
                .rotation3DEffect(
                    .init(degrees: rotate ?  179 : 0),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.3)) {
                rotate.toggle()
            }
        }
    }
}


struct Project1_Previews: PreviewProvider {
    static var previews: some View {
        Project1()
    }
}
