//
//  AutoLoginView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/13/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct AutoLoginView: View {
    var body: some View {
        AutoLogin()
    }
}

struct AutoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AutoLoginView()
            .previewLayout(.fixed(width: 816, height: 410))
    }
}

struct SocialButton: View {
    
    let imageName: String
    let bgColor: Color
    var body: some View {
        Button(action: {}) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(8)
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(bgColor)
                .clipShape(Circle())
        }
    }
}

struct AutoLogin: View {
    let blueColor = Color(red: 0.219, green: 0.711, blue: 0.951)
    let purpleColor = Color(red: 0.514, green: 0.229, blue: 0.961)
    var texts = ["Learn", "Build", "Teach", "Learn"]
    let gradient: [Color] = [Color(red: 0.514, green: 0.229, blue: 0.961), Color(red: 0.219, green: 0.711, blue: 0.951)]
    
    @State var isLoggedIn = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass:
    UserInterfaceSizeClass?
    
    
    @State var username = ""
    @State var password = ""
    @State var zIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                if self.horizontalSizeClass == .compact {
                    VStack(alignment: .leading) {
                        
                        HStack(alignment: .bottom) {
                            Text("Login")
                                .bold()
                                .font(.system(size: 50, weight: .semibold))
                                .padding(.leading)
                                .padding(.bottom)
                            
                            Spacer()
                            ZStack {
                                
                                VStack {
                                    Spacer()
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: .topTrailing, endPoint: .bottomLeading))
                                        .frame(width: 50, height: 50)
                                        .offset(x: -20, y: -20)
                                }
                                
                                Circle()
                                    .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: .bottomLeading))
                                    .animation(.linear(duration: 0.4))
                                    .frame(width: self.isLoggedIn ? 1000 : 200, height: self.isLoggedIn ? 2000 : 200)
                                    .offset(x: 100, y: 0)
                                    .zIndex(10)
                                
                            }
                        }
                        .frame(height: self.isLoggedIn ? geometry.size.height * 2 : geometry.size.height / 3.5)
                        
                        
                        VStack() {
                            HStack(spacing: 10) {
                                Rectangle()
                                    .fill(self.blueColor)
                                    .frame(width: 8)
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                    
                                    VStack(alignment: .leading, spacing: 30) {
                                        Text("Hello!!")
                                            .bold()
                                            .font(.system(size: 20))
                                        VStack(alignment: .leading) {
                                            Text("Username")
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color.gray)
                                            VStack(spacing: 4) {
                                                TextField("Cedric03", text: self.$username)
                                                Rectangle()
                                                    .fill(Color.gray.opacity(0.5))
                                                    .frame(height: 1)
                                            }
                                            
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            Text("Password")
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color.gray)
                                            VStack(spacing: 4) {
                                                HStack {
                                                    SecureField("passwo··rd_cdric_03", text: self.$password)
                                                    Button(action: {}) {
                                                        Text("I Forgot")
                                                            .bold()
                                                            .font(.system(size: 18))
                                                            .foregroundColor(self.blueColor)
                                                    }
                                                }
                                                Rectangle()
                                                    .fill(Color.gray.opacity(0.5))
                                                    .frame(height: 1)
                                            }
                                            
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        .frame(height: geometry.size.height / 3)
                        .padding(.horizontal, 30)
                        
                        
                        HStack {
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: .center, endPoint: .bottomLeading))
                                    .frame(width: 200, height: 55)
                                
                                Button(action: {
                                    self.isLoggedIn.toggle()
                                }) {
                                    Text("Login")
                                        .font(.system(size: 22, weight: .heavy))
                                        .foregroundColor(Color.white)
                                        .padding(.leading, -35)
                                        .frame(width: 200, height: 50)
                                }
                            }
                            .offset(x: 50, y: 0)
                        }
                        .padding(.vertical, 35)
                        
                        VStack {
                            HStack {
                                VStack {
                                    Divider()
                                        .frame(height: 1)
                                        .background(Color.gray)
                                }
                                Text("Social Login")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color.gray)
                                VStack {
                                    Divider()
                                        .frame(height: 1)
                                        .background(Color.gray)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 25) {
                                SocialButton(imageName: "facebook", bgColor: Color(red: 0.231, green: 0.35, blue: 0.594))
                                SocialButton(imageName: "instagram", bgColor: Color(red: 0.827, green: 0.183, blue: 0.186))
                                SocialButton(imageName: "twitter", bgColor: Color(red: 0.334, green: 0.673, blue: 0.932))
                                SocialButton(imageName: "linkedin", bgColor: Color(red: 0.014, green: 0.476, blue: 0.726))
                            }
                            .padding(.vertical)
                        }
                        
                        HStack {
                            Spacer()
                            Text("New User?")
                            Button(action: {}){
                                Text("Sign Up")
                                    .foregroundColor(self.blueColor)
                            }
                            Spacer()
                            
                        }
                        .font(.system(size: 20, weight: .semibold))
                        
                        
                        Spacer()
                        
                    }.zIndex(2)
                } else {
                    HStack {
                        VStack {
                            HStack(alignment: .bottom) {
                                Text("Login")
                                    .bold()
                                    .font(.system(size: 50, weight: .semibold))
                                    .padding(.leading)
                                    .padding(.bottom)
                                
                                
                                ZStack {
                                    VStack {
                                        Spacer()
                                            .frame(height: 80)
                                        Circle()
                                            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: .topTrailing, endPoint: .bottomLeading))
                                            .frame(width: 50, height: 50)
                                            .offset(x: -10, y: -20)
                                    }
                                    
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: .bottomLeading))
                                        .animation(.linear(duration: 0.4))
                                        .frame(width:  150, height: 150)
                                        .offset(x: 100, y: 0)
                                        .zIndex(10)
                                    
                                }
                                .padding()
                            }
                            Spacer()
                            VStack {
                                HStack {
                                    VStack {
                                        Divider()
                                            .frame(height: 1)
                                            .background(Color.gray)
                                    }
                                    Text("Social Login")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(Color.gray)
                                    VStack {
                                        Divider()
                                            .frame(height: 1)
                                            .background(Color.gray)
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                HStack(spacing: 25) {
                                    SocialButton(imageName: "facebook", bgColor: Color(red: 0.231, green: 0.35, blue: 0.594))
                                    SocialButton(imageName: "instagram", bgColor: Color(red: 0.827, green: 0.183, blue: 0.186))
                                    SocialButton(imageName: "twitter", bgColor: Color(red: 0.334, green: 0.673, blue: 0.932))
                                    SocialButton(imageName: "linkedin", bgColor: Color(red: 0.014, green: 0.476, blue: 0.726))
                                }
                                .padding(.vertical)
                                
                            }
                            Spacer()
                        }
                        .frame(width: geometry.size.width / 2.2)
                        
                        Spacer()
                        HStack {
                            VStack {
                                VStack {
                                    HStack(spacing: 10) {
                                        Rectangle()
                                            .fill(self.blueColor)
                                            .frame(width: 8)
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color.white)
                                            
                                            VStack(alignment: .leading, spacing: 30) {
                                                Text("Hello!!")
                                                    .bold()
                                                    .font(.system(size: 20))
                                                VStack(alignment: .leading) {
                                                    Text("Username")
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(Color.gray)
                                                    VStack(spacing: 4) {
                                                        TextField("Cedric03", text: self.$username)
                                                        Rectangle()
                                                            .fill(Color.gray.opacity(0.5))
                                                            .frame(height: 1)
                                                    }
                                                    
                                                }
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Password")
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(Color.gray)
                                                    VStack(spacing: 4) {
                                                        HStack {
                                                            SecureField("passwo··rd_cdric_03", text: self.$password)
                                                            Button(action: {}) {
                                                                Text("I Forgot")
                                                                    .bold()
                                                                    .font(.system(size: 18))
                                                                    .foregroundColor(self.blueColor)
                                                            }
                                                        }
                                                        Rectangle()
                                                            .fill(Color.gray.opacity(0.5))
                                                            .frame(height: 1)
                                                    }
                                                    
                                                }
                                            }
                                            .padding()
                                        }
                                    }
                                }
                                .frame(height: geometry.size.height / 1.6)
                                .padding(.horizontal, 30)
                                
                                HStack {
                                    Spacer()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: .center, endPoint: .bottomLeading))
                                            .frame(width: 200, height: 55)
                                        
                                        Button(action: {
                                            self.isLoggedIn.toggle()
                                        }) {
                                            Text("Login")
                                                .font(.system(size: 22, weight: .heavy))
                                                .foregroundColor(Color.white)
                                                .padding(.leading, -35)
                                                .frame(width: 200, height: 50)
                                        }
                                    }
                                    .offset(x: 50, y: 0)
                                }
                                //                                .padding(.vertical, 35)
                            }
                            
                        }
                            
                        .frame(width: geometry.size.width / 2)
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
