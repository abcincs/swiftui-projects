//
//  FloatingButton.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/3/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct FloatingButton: View {
    
    @State var showPopUp = false
    
    var buttons = ["camera", "photo"]
    let buttonSize: CGFloat = 60
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                ZStack {
                    if self.showPopUp {
                        PlusButton(image: "camera")
                            .offset(y:  -geometry.size.height / 5)
                        PlusButton(image: "photo")
                            .offset(x: geometry.size.height / 5 )
                    }
                }
                PlusButton(image: "plus")
                    .rotationEffect(Angle(degrees: self.showPopUp ? 45 : 0))
                    .animation(Animation.linear(duration: 0.25))
                    .onTapGesture {
                        withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.75, blendDuration: 0.5)) {
                            self.showPopUp.toggle()
                        }
                }
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}

struct PlusButton: View {
    var image: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.black)
                .frame(width: 60, height: 60)
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .animation(Animation.linear(duration: 0.5))
        }
        .transition(.scale)
    }
}
