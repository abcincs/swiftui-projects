//
//  CrazyZCards.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/11/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyZCards: View {
    @State private var track: Double = 0.75
    var cards = ["Discover", "Learn", "Share"]
    var cardMessages = ["If you're offered a seat on a rocket ship, don't ask what seat!Just get on.", "Learn", "Share"]
    private let offSets: [CGFloat] = [10,20, 30]
    private let backGroundOpacities = [0.33,0.66,1.0]
    
    @State private var scaleIndex: CGFloat = 0.0
    var body: some View {
        GeometryReader  { geo in
            VStack {
                Spacer()
                ZStack {
                    ForEach(0 ..< self.cards.count) { index in
                        VStack(spacing: 0) {
                            Image("learn\(index)")
                                .resizable()
                                .aspectRatio(2/2.5,contentMode: .fit)
                                .frame(width: geo.size.width - 60)
                                .cornerRadius(100, corners: .topRight)
                            VStack {
                                Text(self.cards.reversed()[index]).font(.system(size: 50, weight: .bold))
                                
                                Text("If you're offered a seat on a rocket ship, don't ask what seat!Just get on.")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 17))
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .padding(.horizontal)
                            }
                            .padding(.vertical)
                            .padding(.vertical)
                            .frame(width: geo.size.width - 60)
                                
                            .background(Color.white.opacity(self.backGroundOpacities[index]))
                            .cornerRadius(100, corners: .bottomLeft)
                        }
                        .offset(x: self.offSets[index], y: -self.offSets[index])
                    }
                }
                .offset(x: -30)
                Spacer()
                HStack {
                    Spacer()
                    Text("CONTINUE")
                    Spacer()
                    Image(systemName: "arrow.right").padding(.trailing)
                }
                .foregroundColor(Color.white)
                .padding()
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(100, corners: .topLeft)
                .cornerRadius(20, corners: .bottomRight)
            }.edgesIgnoringSafeArea(.bottom)
            
        }
        .background(Color(red: 0.143, green: 0.077, blue: 0.194).edgesIgnoringSafeArea(.all))
    }
}

struct CrazyZCards_Previews: PreviewProvider {
    static var previews: some View {
        CrazyZCards()
    }
}
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
