//
//  SessionsView.swift
//  Views
//
//  Created by Cédric Bahirwe on 13/01/2021.
//

import SwiftUI



///Add `SessionsView` , a view with the behavior as the Mac Login Screen
struct SessionsView: View {
    @State private var showPasswordField = false
    @State private var adminSession: Bool? = nil
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.vertical)
                .overlay(Image("wall").resizable())
            VStack {
                HStack(spacing: 50){
                    if adminSession == nil || adminSession == false {
                    VStack {
                        Image("wall")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        Text("Cedric Bahirwe")
                            .foregroundColor(.white)

                    }
                    .contentShape(Rectangle())
                    .allowsTightening(adminSession != false)
                    .transition(.move(edge: .leading))
                    .onTapGesture {
                        withAnimation {
                            showPasswordField.toggle()
                            adminSession = false
                        }
                    }
                    }
                    
                    if adminSession == nil || adminSession == true {
                    VStack {
                        Image("stadium")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        Text("Common World Inc.")
                            .foregroundColor(.white)
                    }
                    .contentShape(Rectangle())
                    .transition(.move(edge: .trailing))
                    .allowsTightening(adminSession != true)
                    .onTapGesture {
                        withAnimation {
                            showPasswordField.toggle()
                            adminSession = true
                        }
                    }
                    }
                }
                .frame(height: 105)
                Spacer()
                if showPasswordField {
                HStack {
                    Button(action: {
                        withAnimation {
                            adminSession = nil
                            showPasswordField = false
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 30, height: 45)
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                    })
                    TextField("Enter Password", text: .constant(""))
                        .frame(width: 160, height: 30)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(6)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 30, height: 45)
                            .background(Color.white.opacity(0.6))
                            .clipShape(Circle())
                    })
                }
                .frame(height: 35)
                }

            }.frame(height: 140)
            
            
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
            .previewLayout(.fixed(width: 800, height: 400))
    }
}
