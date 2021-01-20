//
//  CrazyAudioMack.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/10/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyAudioMack: View {
    private var colorOne = Color(red: 0.17, green: 0.258, blue: 0.314)
    private let colorTwo = Color(red: 0.215, green: 0.181, blue: 0.157)
    @State var charts = [Chart(width: 20, height: 100, color: .red), Chart(width: 38, height: 75, color: .pink), Chart(width: 15, height: 85, color: .green), Chart(width: 55, height: 50, color: .purple), Chart(width: 8, height: 75, color: .yellow), Chart(width: 15, height: 85, color: .green), Chart(width: 35, height: 50, color: .purple), Chart(width: 8, height: 75, color: .yellow), Chart(width: 15, height: 85, color: .secondary), Chart(width: 5, height: 50, color: .purple), Chart(width: 8, height: 75, color: .orange), Chart(width: 15, height: 85, color: .green), Chart(width: 5, height: 50, color: .purple), Chart(width: 8, height: 75, color: .yellow), Chart(width: 15, height: 85, color: .pink), Chart(width: 5, height: 50, color: .blue)]
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(systemName: "arrowtriangle.down")
                        .resizable()
                        .frame(width: 30, height: 20)
                    Spacer()
                    VStack(spacing: -4) {
                        Image(systemName: "rectangle.grid.1x2.fill")
                            .resizable()
                            .frame(width: 20, height: 13)
                        
                        Image(systemName: "rectangle.grid.1x2.fill")
                            .resizable()
                            .frame(width: 20, height: 13)
                    }
                    .overlay(
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 11, height: 11)
                            .offset(x: 6, y: 6)
                            .padding([.top, .leading], -5)
                            .background(self.colorOne)
                        , alignment: .bottomTrailing)
                    
                }
                .padding()
                .foregroundColor(Color.white)
                
                
                
                VStack {
                    Image("learn3")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: geometry.size.width / 1.4)
                        .shadow(radius: 2)
                    
                    VStack(spacing: 5) {
                        Text("Ashley").font(.system(size: 28, weight: .regular))
                        Text("Isak Danielson - Bleed Out").font(.system(size: 22, weight: .bold))
                    }.padding(.vertical, 20)
                }.foregroundColor(Color.white)
                
                
                
                HStack(spacing: 28) {
                    VStack {
                        Image(systemName: "suit.heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Favorite").foregroundColor(Color.gray)
                    }
                    VStack {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Playlist").foregroundColor(Color.gray)
                    }
                    VStack {
                        Image(systemName: "arrow.2.squarepath")
                            .resizable()
                            .frame(width: 40, height: 25)
                        Text("Re-Up").foregroundColor(Color.gray)
                    }
                    VStack {
                        Image(systemName: "checkmark.rectangle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.orange)
                        Text("Download").foregroundColor(Color.white)
                    }
                    VStack {
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 25, height: 25)
                        
                        Text("Share").foregroundColor(Color.gray)
                    }
                }.foregroundColor(Color.white)
                    .font(.system(size: 14))
                
                Spacer()
                VStack {
                    HStack(alignment: .bottom, spacing: 2) {
                        ForEach(self.charts) { chart in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.orange)
                                .frame(width: 3, height: CGFloat(integerLiteral: chart.height / 2), alignment: .bottom)
                        }
                        
                        ForEach(self.charts) { chart in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 2.5, height: CGFloat(integerLiteral: chart.height / 2), alignment: .bottom)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 2.5,height: CGFloat(integerLiteral: chart.height / 2) / 1.2, alignment: .bottom)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 2.5,height: CGFloat(integerLiteral: chart.height / 2), alignment: .bottom)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 2.5, height: CGFloat(integerLiteral: chart.height / 2) / 1.5, alignment: .bottom)
                            
                        }
                    }
                    HStack {
                        Text("0:12").bold()
                        Spacer()
                        Text("0:12").bold()
                    }
                }
                .padding(.horizontal)
                .foregroundColor(Color.white)
                
                Spacer()
                HStack {
                    Text("HIFI").font(.system(size: 15, weight: .bold)).padding(.horizontal, 6).padding(.vertical, 3).background(Color(red: 0.118, green: 0.118, blue: 0.124))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    Spacer()
                    HStack(spacing: 20) {
                        Image(systemName: "backward.end.alt").resizable().frame(width: 40, height: 25)
                        Image(systemName: "pause.circle").resizable().frame(width: 70, height: 70)
                        Image(systemName: "forward.end.alt").resizable().frame(width: 40, height: 25)
                    }
                    Spacer()
                    Image(systemName: "airplayaudio").resizable().frame(width: 30, height: 30)
                }
                .padding(.horizontal)
                .foregroundColor(Color.white)
                
                Spacer()
                HStack {
                    ForEach(["shuffle", "arrow.counterclockwise", "centsign.circle"], id: \.self) { index in
                        Image(systemName: index)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40,height: 25)
                            .padding(.vertical, 18)
                            .padding(.horizontal, 40)
                            .background(Color(red: 0.113, green: 0.113, blue: 0.113))
                            .clipShape(Capsule(style: .circular))
                    }
                }
                .padding(.horizontal)
                .foregroundColor(Color.white)
                Spacer()
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [self.colorOne, self.colorTwo]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.vertical))
    }
}

struct CrazyAudioMack_Previews: PreviewProvider {
    static var previews: some View {
        CrazyAudioMack()
    }
}






