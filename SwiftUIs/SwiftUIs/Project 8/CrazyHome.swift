//
//  CrazyHome.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/10/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyHome: View {
    @State var track: Double = 0.75
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "chart.bar.fill")
                        .imageScale(.medium)
                    Text("MTN Rwanda").font(.system(size: 20))
                    
                    
                    Spacer()
                    Image(systemName: "lock.rotation")
                        .imageScale(.medium)
                    
                    Image(systemName: "alarm.fill")
                        .imageScale(.medium)
                    
                    Text("70%").font(.system(size: 20))
                    Image(systemName: "battery.100")
                        .imageScale(.medium)
                    
                }
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .padding(.top, -10)
                Spacer().frame(height: 70)
                VStack {
                    Text("7:00")
                        .font(.system(size: 95, weight: .light))
                        .foregroundColor(.white)
                    Text("Wednesday, September 9")
                        .font(.system(size: 25, weight: .light))
                        .foregroundColor(.white)
                    
                    
                }
                
                Spacer().frame(height: 30)
                VStack {
                    Spacer()
                    HStack {
                        Image("learn0")
                            .resizable()
                            .frame(width: 85, height: 50)
                        VStack(alignment: .leading) {
                            Text("iPhone").bold().foregroundColor(Color(.darkGray))
                            Text("Isak Danielson - Bleed Out").bold()
                            Text("Ashley")
                        }
                        Image(systemName: "airplayaudio")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            
                            .padding(6)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Circle())
                    }
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Slider(value: self.$track, in: 0.0...3.0, step: 0.1)
                            .accentColor(Color.white)
                        
                        HStack {
                            Text("0:00")
                            Spacer()
                            Text("-3:00")
                        }
                        .foregroundColor(Color.gray.opacity(0.8))
                    }
                    
                    Spacer()
                    HStack {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 35, height: 25)
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 25, height: 35)
                            .padding(.horizontal, 50)
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 35, height: 25)
                        
                    }
                    Spacer()
                    
                    
                    HStack {
                        Image(systemName: "speaker.1.fill")
                            .imageScale(.large)
                            .foregroundColor(Color.gray.opacity(0.8))
                        Slider(value: self.$track, in: 0.0...3.0, step: 0.1)
                            .accentColor(Color.white)
                            .padding(.horizontal, 5)
                        Image(systemName: "speaker.3.fill")
                            .imageScale(.large)
                            .foregroundColor(Color.gray.opacity(0.8))
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding(.vertical)
                .padding(.vertical)
                .padding(.horizontal, 6)
                    
                .frame(width: geometry.size.width - 20, height: geometry.size.height / 2.8)
                    
                .background(Color.black.opacity(0.85))
                .contrast(0.8)
                    
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Spacer()
                Text("Press home to open").bold().foregroundColor(.white)
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 10, height: 10)
                    
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.white)
                    Image(systemName: "camera.fill")
                        .imageScale(.small)
                }
                .foregroundColor(Color.white.opacity(0.5))
                Spacer().frame(height: 20)
            }
                
            .background(Image("beach")
            .resizable()
            .frame(width: geometry.size.width, height: 895 + 36)
                //            .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct CrazyHome_Previews: PreviewProvider {
    static var previews: some View {
        CrazyHome()
    }
}
