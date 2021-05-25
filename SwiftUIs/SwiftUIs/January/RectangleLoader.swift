//
//  RectangleLoader.swift
//  Views
//
//  Created by Cédric Bahirwe on 12/01/2021.
//

import SwiftUI

struct RectangleLoader: View {
    @State private var isLoading: Bool = false
    //    let (x−h)2+(y−k)2=r2
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 2) {
                
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .padding(5)
                    .frame(width: 17, height: 20)
                    .background(Color.orange)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                Text("COM Playing Style")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            Text("Some players possess COM playing styles when on the ball. Set to COM control for best results.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .light, design: .rounded))
                .padding(.vertical, 5)
            
            
            LinearGradient(gradient: Gradient(colors: [.gray, Color(.lightGray), .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .mask(
                    Image(systemName: "line.3.crossed.swirl.circle.fill")
                        .resizable()
                        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    
                )
                .onAppear {
                    isLoading = true
                }
        }
        .padding()
        .frame(width: 300)
        .padding(.bottom,5)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
        .shadow(color: Color.white.opacity(0.7), radius: 3, x: -2, y: -2)
        .foregroundColor(.black)
    }
}

struct RectangleLoader_Previews: PreviewProvider {
    static var previews: some View {
        RectangleLoader()
            .previewLayout(.fixed(width: 340, height: 280))

    }
}
