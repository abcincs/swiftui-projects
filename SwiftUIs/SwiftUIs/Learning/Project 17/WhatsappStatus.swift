//
//  WhatsappStatus.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 11/10/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct WhatsappStatus: View {
    @State private var n1: CGFloat = 100
    @State private var n2: CGFloat = 100
    @State private var n3: CGFloat = 100
    
    @State private var isDragging = false
    @State private var isFull = false
    @State var dragAmount = CGSize.zero
    @State private var radius: CGFloat = 300.0
    
    @State var binder = false
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Color.gray.opacity(isDragging ? 0.7 : 0.0).edgesIgnoringSafeArea(.all)
            ZStack {
                Circle()
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [n1,n2,n3], dashPhase: 3))
                    .frame(width: 185, height: 185)
                    .rotationEffect(.degrees(-90))
                Image("learn6")
                    .resizable()
                    .frame(width: isFull ? 415 : 170, height: isFull ? isDragging ? 400 : 920 : 170)
                    .applyClip(radius: $radius)
                    .offset(self.dragAmount)
                    .onTapGesture {
                        if !self.isFull {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5)) {
                                radius = .zero
                                self.isFull.toggle()
                                self.binder = self.isFull && !self.isDragging
                            }
                        }
                }
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            if self.isFull {
                                radius = 1000
                                withAnimation {
                                    self.isDragging = true
                                    self.dragAmount = value.translation
                                    self.binder = self.isFull && !self.isDragging
                                }
                            }
                            
                    }
                    .onEnded { value in
                        if self.isFull {
                            withAnimation(.spring()) {
                                self.dragAmount = .zero
                                self.isFull = false
                                self.isDragging = false
                                self.binder = self.isFull && !self.isDragging
                            }
                        }
                    }
                    
                )
            }
            
        }
        .onReceive(timer) { _ in
            withAnimation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).delay(0.2).speed(0.2)) {
                self.n1 = CGFloat.random(in: 5...120)
                self.n2 = CGFloat.random(in: 50...120)
                self.n3 = CGFloat.random(in: 5...120)
            }
        }
        
    }
}

struct WhatsappStatus_Previews: PreviewProvider {
    static var previews: some View {
        WhatsappStatus()
    }
}

struct RightClip: ViewModifier {
    
    @Binding var radius: CGFloat
    func body(content: Content) -> some View {
        
        ZStack {
            content.clipShape(RoundedRectangle(cornerRadius: radius))
        }
        
    }
}


extension View {
    func applyClip(radius: Binding<CGFloat>) -> some View {
        return modifier(RightClip(radius: radius))
    }
}
