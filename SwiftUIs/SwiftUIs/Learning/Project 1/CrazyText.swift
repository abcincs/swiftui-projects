//
//  CrazyText.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/27/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct CrazyText: View {
    @State var animate = false
    @State var speed: Float = 1.0
    var body: some View {
        Text("")
            .padding()
            .padding()
            
            .padding()
            .foregroundColor(.white)
            .background(AngularGradient(gradient: Gradient(colors: [.white, .red, .white, .white, .white, .black, .white]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 270)))
            
            .rotationEffect(Angle(degrees: self.animate ? 360 : 0))
            
            .animation(Animation.linear(duration: Double(self.speed)).repeatForever(autoreverses: false))
            //                .rotationEffect(self.animate ? 360 : 0)
            //                . background(RadialGradient(gradient: Gradient(colors: [.red, .white, .green]), center: .ce, startRadius: 10, endRadius: 25))
            //            .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
            .clipShape(Circle())
        .onAppear {
            self.animate.toggle()
            let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) {_ in
                print(self.speed)
                if self.speed <= 0.0 {
                    self.speed = 1
                    
                } else {
                    self.speed -= 0.1
                }
            }
        }
    }
}


struct CrazyText_Previews: PreviewProvider {
    static var previews: some View {
        CrazyText()
    }
}
