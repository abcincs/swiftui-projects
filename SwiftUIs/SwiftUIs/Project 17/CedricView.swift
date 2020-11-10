//
//  CedricView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/20/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CedricView: View {
    let geometry = UIScreen.main.bounds.size
    @State private var n1: CGFloat = 100
    @State private var n2: CGFloat = 100
    @State private var n3: CGFloat = 100
    
    @State private var isDragging = false
    @State private var isFull = false
    @State var dragAmount = CGSize.zero
    
    @State var binder = false
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [n1,n2,n3], dashPhase: 3))
                    .frame(width: 185, height: 185)
                    .rotationEffect(.degrees(-90))
                Image("learn6")
                    .resizable()
                    .frame(width: isFull ? 400 : 170, height: isFull ? 890 : 170)
                    .applyClip(isNotCircle: $binder)
                    .offset(self.dragAmount)
                    .onTapGesture {
                        withAnimation(Animation.spring().speed(0.3)) {
                            self.isFull.toggle()
                            self.binder = self.isFull && !self.isDragging
                        }
                }
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            if self.isFull {
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

struct CedricView_Previews: PreviewProvider {
    static var previews: some View {
        CedricView()
    }
}


struct RightClip: ViewModifier {
    
    @Binding var isNotCircle: Bool
    func body(content: Content) -> some View {
        
        ZStack {
            if isNotCircle {
                content.clipShape(RoundedRectangle(cornerRadius: 1))
            } else {
                content.clipShape(Circle())
            }
        }
        
    }
}


extension View {
    func applyClip(isNotCircle: Binding<Bool>) -> some View {
        return modifier(RightClip(isNotCircle: isNotCircle))
    }
}
