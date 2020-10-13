//
//  TabView.swift
//  Music
//
//  Created by Cedric Bahirwe on 8/19/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct TabBar: View {
    @State var showPopUp = false
    let colors: [Color] = [Color(red: 67/255, green: 206/255, blue: 162/255).opacity(0.5), Color(red: 24/255, green: 90/255, blue: 157/255).opacity(0.5)]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
//                .edgesIgnoringSafeArea(.all)
                Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                VStack(alignment: .leading){
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Friday, 15 Dec")
                                .bold()
                            Spacer()
                            Image(systemName: "bell.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .opacity(0.7)
                                
                        }
                        .foregroundColor(.gray)
                        .padding()
                        
                        
                        VStack(alignment: .leading) {
                            Text("Hi, Cédric")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(Color.black.opacity(0.8))
                            Text("Hope you are well today")
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Time Tracker")
                            .bold()
                            .font(.system(size: 22))
                            .foregroundColor(Color.black.opacity(0.8))
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color.orange.opacity(0.15))
                                    .frame(width: geometry.size.width - 20, height: 70)
                                
                                HStack(spacing: 15) {
                                    Image(systemName: "music.note")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.white)
                                        .padding(8)
                                        .frame(width: 35, height: 35)
                                        .background(Color.orange)
                                        .cornerRadius(8)
                                        .padding(.leading)
                                    
                                    Text("Playing...")
                                        .font(.system(size: 22, weight: .light))
                                    
                                    Spacer()
                                    Text("01:00:01")
                                        .foregroundColor(Color.orange)
                                        .font(.system(size: 18, weight: .bold))
                                        .padding(.trailing)
                                }
                            }
                        }
                        .padding()
                    
                        VStack(alignment: .leading) {
                            Text("Tips of the day")
                                .bold()
                                .font(.system(size: 22))
                                .foregroundColor(Color.black.opacity(0.8))
                                .padding(.leading)
                            
                            ScrollView([.horizontal], showsIndicators: false) {
                                HStack(spacing: 1) {
                                    TipView(width: geometry.size.width / 2 - 15, image: "city", title: "")
                                    TipView(width: geometry.size.width / 2 - 15, image: "Retina", title: "")
                                    TipView(width: geometry.size.width / 2 - 15, image: "cosmos", title: "")
                                    
                                    TipView(width: geometry.size.width / 2 - 15, image: "smoke", title: "")
                                    TipView(width: geometry.size.width / 2 - 15, image: "bourse", title: "")
                                }
                                
                            }
                            .animation(.default)
                            Spacer()
                        }
                        
                    }
                    Spacer()
                    ZStack {
                        if self.showPopUp {
                            PlusMenu()
                            .offset(y: -geometry.size.height/5)
                        }
                        HStack {
                            TabBarButton(title: "Home", image: "house.fill", width: geometry.size.width/3/2)
                            TabBarButton(title: "Learn", image: "music.note.list", width: geometry.size.width/3/2)
                            
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.orange)
                                    .frame(width: 60, height: 60)
                                Image(systemName: "music.house")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                    .rotationEffect(Angle(degrees: self.showPopUp ? 180 : 0))
                                    .animation(Animation.linear(duration: 0.5))

                            
                            }
                            .offset(y: -geometry.size.height/10/2)
                            .onTapGesture {
                                withAnimation {
                                    self.showPopUp.toggle()
                                }
                            }
                            TabBarButton(title: "Progress", image: "chart.bar.fill", width: geometry.size.width/3/2)
                            TabBarButton(title: "Profile", image: "person.fill", width: geometry.size.width/3/2)
                            }
                        .frame(width: geometry.size.width + 10, height: geometry.size.height/10)
                        .background(Color.white.opacity(0.2).shadow(radius: 2))
    //                    .padding(.bottom)
                    }
                    
                    }
                .padding(.top)
                .padding(.top)
//                    .edgesIgnoringSafeArea(.bottom)
//                .sheet(isPresented: self.$showPopUp) {
//                        Home()
//                }
            } .edgesIgnoringSafeArea(.all)
            

            }
        }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct PlusMenu: View {
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color.orange)
                    .frame(width: 70, height: 70)
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color.orange)
                    .frame(width: 70, height: 70)
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
            }
        }
        .transition(.scale)
    }
}

struct TabBarButton: View {
    @State var title: String
    @State var image: String
    @State var width: CGFloat
    @State var color: Color? = Color.gray
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 20)
                .frame(width: width, height: 50)
                .foregroundColor(.gray)
            Text(title)
                 .foregroundColor(.gray)
                .padding(.top, -15)
                .font(.system(size: 12, weight: .light, design: .default))
        }
    }
}

struct TipView: View {
    
    @State var width: CGFloat
    @State var image: String
     @State var title: String
    
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:width)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Spacer()
                Text(title)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {})
                {
                    Text("Read More")
                        .font(.system(size: 12, weight: .light))
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                .padding(.horizontal, 10)
                .offset(x: 0, y: -20)
                .foregroundColor(Color.white.opacity(0.76))
                
                
            }
            .padding(.horizontal, 3)
        }
        .frame(width: width)
        .padding(.horizontal, 8)
    }
}
