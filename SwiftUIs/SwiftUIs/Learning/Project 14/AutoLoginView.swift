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
    private let blueColor = Color(red: 0.219, green: 0.711, blue: 0.951)
    private let purpleColor = Color(red: 0.514, green: 0.229, blue: 0.961)
    private var texts = ["Learn", "Build", "Teach", "Learn"]
    private let gradient: [Color] = [Color(red: 0.514, green: 0.229, blue: 0.961), Color(red: 0.219, green: 0.711, blue: 0.951)]
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var isIphone: Bool {
        return (horizontalSizeClass == .compact && verticalSizeClass == .regular)
            || (horizontalSizeClass == .regular && verticalSizeClass == .compact)
    }
    
    @State var username = ""
    @State var password = ""
    @State var zIndex = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                    .edgesIgnoringSafeArea(.all)
                if isIphone {
                    VStack(alignment: .leading) {
                        viewHeader
                            .frame(height: geometry.size.height / 3.7)
                        
                        loginForm
                            .frame(height: geometry.size.height / 3)
                            .padding(.horizontal, 30)
                        loginButton
                            .padding(.vertical, 20)
                        
                        socialsView
                        Spacer(minLength: 10)
                        
                    }.zIndex(2)
                } else {
                    HStack {
                        VStack {
                            viewHeader
                            Spacer()
                            socialsView
                            Spacer()
                        }
                        .frame(width: geometry.size.width / 2.2)
                        
                        Spacer()
                        VStack {
                            
                            loginForm
                                .frame(height: geometry.size.height / 1.7)
                                .padding(.horizontal, 30)
                            loginButton
                                .padding(.top, 10)
                        }
                    }
                }
            }
        }
        .viewIgnoreKeyboard()
    }
}


extension AutoLogin {
    private var socialsView: some View {
        VStack {
            HStack {
                Color.gray.frame(height: 1)
                Text("Social Login")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color.gray)
                Color.gray.frame(height: 1)
            }
            .padding(.horizontal)
            
            HStack(spacing: 25) {
                SocialButton(imageName: "facebook", bgColor: Color(red: 0.231, green: 0.35, blue: 0.594))
                SocialButton(imageName: "instagram", bgColor: Color(red: 0.827, green: 0.183, blue: 0.186))
                SocialButton(imageName: "twitter", bgColor: Color(red: 0.334, green: 0.673, blue: 0.932))
                SocialButton(imageName: "linkedin", bgColor: Color(red: 0.014, green: 0.476, blue: 0.726))
            }
            .padding(.vertical, 8)
            
            HStack {
                Text("New User?")
                Button(action: {}){
                    Text("Sign Up")
                        .foregroundColor(blueColor)
                }
            }
            .font(.system(size: 20, weight: .semibold))
        }
    }
    
    private var loginButton: some View {
        Button(action: { }) {
            Text("Login")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(Color.white)
                .padding(.leading, -35)
                .frame(width: 200, height: 55)
                .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .center, endPoint: .bottomLeading))
                .cornerRadius(30)
        }
        .offset(x: 50, y: 0)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var loginForm: some View {
        VStack {
            HStack(spacing: 10) {
                blueColor
                    .frame(width: 8)
                    .padding(.vertical, 8)
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hello \(username),")
                        .font(.system(size: 20, weight: .bold))
                    VStack(alignment: .leading) {
                        Text("Username")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                        VStack(spacing: 4) {
                            TextField("cbahirwe", text: $username)
                            Color.gray.opacity(0.5).frame(height: 1)
                        }
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                        VStack(spacing: 4) {
                            HStack {
                                SecureField("••••••••", text: $password)
                                Button(action: {}) {
                                    Text("I Forgot")
                                        .bold()
                                        .font(.system(size: 18))
                                        .foregroundColor(blueColor)
                                }
                            }
                            Color.gray.opacity(0.5).frame(height: 1)
                        }
                    }
                }
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
    
    private var viewHeader: some View {
        HStack(alignment: .bottom) {
            Text("Login")
                .bold()
                .font(.system(size: 50, weight: .semibold))
                .padding([.leading, .bottom])
                .lineLimit(1)
                .minimumScaleFactor(0.6)
            if isIphone {
                Spacer()
            }
            ZStack {
                
                VStack {
                    Spacer()
                        .frame(maxHeight: isIphone ? .infinity : 80)
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .frame(width: 50, height: 50)
                        .offset(x: -20, y: -20)
                }
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: gradient), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: .bottomLeading))
                    .frame(width: circleSize.width, height:  circleSize.height)
                    .offset(x: 100, y: 0)
                    .zIndex(10)
                
            }
        }
    }
    
    private var circleSize: CGSize {
        if isIphone {
            return CGSize(width: 200, height: 180)
        } else {
            return CGSize(width: 150, height: 150)
        }
    }
}
