//
//  CrazyRectangles.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/28/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyRectangles: View {
    @State var overlap = 1
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: self.overlap > 0 ? 200 : 100, height: self.overlap > 0 ? 200 : 100)
                    .clipShape(RoundedRectangle(cornerRadius: self.overlap > 0 ? 0 : 200))
                    .rotationEffect(Angle(degrees: self.overlap > 0 ? 360 : 0))
                    .zIndex(Double(self.overlap))
                
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: self.overlap > 0 ? 200 : 100, height: self.overlap > 0 ? 200 : 100)
                    .clipShape(RoundedRectangle(cornerRadius: self.overlap > 0 ? 0 : 200))
                    .rotationEffect(Angle(degrees: self.overlap > 0 ? 360 : 0))
                    .zIndex(Double(-1 * self.overlap))
                    
            }
            .onAppear {
                let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    withAnimation(.spring(response: 01, dampingFraction: 0.5, blendDuration: 0)) {
                        self.overlap *= -1
                    }
                }
            }
        }
    }
}


struct CrazyRectangles_Previews: PreviewProvider {
    static var previews: some View {
        CrazyRectangles()
    }
}
