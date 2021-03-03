//
//  FragmentableView.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 03/03/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct FragmentableView<Content: View>: View {
    var color = Color.black
    @Binding var animate: Bool
    var content: () -> Content
    
    var body: some View {
        content()
            .opacity(animate ? 1 : 0)
            .transition(.asymmetric(insertion: .opacity, removal: .identity))
            .animation(animate ? Animation.linear.speed(0.25) : nil )
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    color
                        .edgesIgnoringSafeArea(.bottom)
                        .opacity(animate ? 1 : 0)
                    GeometryReader { geometry in
                        
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                color
                                    .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                                    .rotationEffect(.degrees(animate ? 0 : 85), anchor: .topLeading)
                                    .offset(
                                        x: animate ? 0 : -geometry.size.width/2+5
                                    )
                                color
                                    .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                                    .rotationEffect(.degrees(animate ? 0 : -85), anchor: .topTrailing)
                                    .offset(
                                        x: animate ? 0 : geometry.size.width/2+5
                                    )
                                
                            }
                            HStack(spacing: 0) {
                                color
                                    .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                                    .rotationEffect(.degrees(animate ? 0 : -85), anchor: .bottomTrailing)
                                    .scaleEffect(animate ? 1 : 0.3)
                                    .offset(
                                        y: animate ? 0 : geometry.size.width/2+5
                                    )
                                
                                color
                                    .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                                    .rotationEffect(.degrees(animate ? 0 : 85), anchor: .bottomLeading)
                                    .offset(
                                        y: animate ? 0 : geometry.size.width/2+5
                                    )
                                
                            }
                        }
                    }
                }
                
            )
            .frame(height: UIScreen.main.bounds.width)
            .animation(.spring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.5))
    }
}
