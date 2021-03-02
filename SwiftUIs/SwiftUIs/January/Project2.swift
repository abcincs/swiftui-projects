//
//  Project2.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 22/01/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

// Kahoot loader UI
struct Project2:View {
    @State var offSetR: CGSize = .init(width: -90, height: -90)
    @State var offSetG: CGSize = .init(width: 0, height: -90)
    @State var offSetB: CGSize = .init(width: -90, height: 0)
    @State var offSetZ: CGSize = .zero
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                SImage("triangle.fill", bgColor: .red)
                    .offset(offSetR)
                
                SImage("suit.diamond.fill", bgColor: .green)
                    .offset(offSetG)
                
                SImage("rectangle.fill", bgColor: .orange)
                    .offset(offSetZ)

                SImage("circle.fill", bgColor: .blue)
                    .offset(offSetB)
            }
            .offset(x: 45, y: 45)
        }
        .onAppear(perform: animate)
        
    }
    
    
    private func SImage(_ image: String, bgColor: Color) -> some View {
        return Image(systemName: image)
            .resizable()
            .padding()
            .foregroundColor(.white)
            .frame(width: 80, height: 80)
            .background(bgColor)
            .cornerRadius(8)
    }
    
    func animate() {
        let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.75, blendDuration: 0.5)) {
                let current = offSetZ
                offSetZ = offSetB
                offSetB = offSetR
                offSetR = offSetG
                offSetG = current
            }
        }
    }
}

struct Project2_Previews: PreviewProvider {
    static var previews: some View {
        Project2()
    }
}
