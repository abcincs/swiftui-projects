//
//  Home.swift
//  Music
//
//  Created by Cedric Bahirwe on 8/20/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var imageIndex = 0
    private let images: [String] = ["saves", "search", "world", "file", "joy"]
    
    var body: some View {
        GeometryReader { geom in
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {}) {
                        Text("Skip")
                        .bold()
                            .foregroundColor(Color.gray)
                    }
                }
                .padding()
                Image(self.images[self.imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geom.size.width - 40, height: geom.size.height / 2.5)
                    .clipped()
                
                VStack {
                    
                    Text("Chart Up!")
                    .bold()
                    .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.black.opacity(0.8))
                    
                    Text("Beginner Exercise")
                        .bold()
                        .foregroundColor(.gray)
                    HStack(spacing: 10) {
                        StarsView(rating: 4, starsize: CGSize(width: 15, height: 15))
                        HStack {
                            Text("4.0")
                            .bold()
                            Text("/ 5.0")
                            .bold()
                                .foregroundColor(.gray)
                        }
                    }
                    Text("Images greatly help in understanding, interpreting and visualizing data. Adding textual description to images is the first and foremost principle of web accessibility. ")
                        .foregroundColor(.gray)
                        .font(.system(size: 17, weight: .regular))
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
                VStack(spacing: 10) {
                    Button (action: {}) {
                        Text("Begin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 80)
                            .padding()
                            .frame(width: geom.size.width - 30, height: 60)
                            .background(Color.orange)
                            .cornerRadius(15)
                    }
                    
                    Button (action: {}) {
                        Text("Instruction")
                            .bold()
                            .foregroundColor(Color.black.opacity(0.8))
                            .padding(.horizontal, 80)
                            .padding()
                            .frame(width: geom.size.width - 30, height: 60)
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(15)
                    }
                }
                
                Spacer()
            }
            .onAppear() {

                let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                    if self.imageIndex < self.images.count - 1 {
//                        withAnimation(Animation.interactiveSpring(response: 0.5, dampingFraction: 0.15, blendDuration: 0.5).repeatForever(autoreverses: false)) {
                        withAnimation(Animation.interpolatingSpring(stiffness: 0.1, damping: 0.5, initialVelocity: 1)) {
                            self.imageIndex += 1
                        }
                    } else {
                        self.imageIndex = 0
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct StarsView: View {
    @State var rating: Int
    @State var starsize: CGSize = CGSize(width: 30, height: 30)
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index + 1 > self.rating ? "star" : "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: self.starsize.width, height: self.starsize.height)
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rate(at: index + 1)
                }
            }
        }
    }
    
    func rate(at index: Int) {
        
        self.rating = index == self.rating ? 0 : index
    }
}
