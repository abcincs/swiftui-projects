//
//  Project2.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 22/01/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


// Kahoot loader concept
struct Project2:View {
    @State var offSetR: CGSize = .init(width: -90, height: -90)
    @State var offSetG: CGSize = .init(width: 0, height: -90)
    @State var offSetB: CGSize = .init(width: -90, height: 0)
    @State var offSetZ: CGSize = .zero
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                Image(systemName: "triangle.fill")
                    .resizable()
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.red)
                    .cornerRadius(8)
                    .offset(offSetR)
                
                Image(systemName: "suit.diamond.fill")
                    .resizable()
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.green)
                    .cornerRadius(8)
                    .offset(offSetG)
                
                Image(systemName:"rectangle.fill")
                    .resizable()
                    .padding()
                    .padding(5)
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.orange)
                    .cornerRadius(8)
                    .offset(offSetZ)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .offset(offSetB)
            }
            .offset(x: 45, y: 45)
        }
        .onAppear(perform: animate)
        
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
