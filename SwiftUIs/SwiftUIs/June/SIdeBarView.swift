//
//  SIdeBarView.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 04/06/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


fileprivate struct Message: Identifiable {
    let id = UUID()
    let author: String = "cedricbahirwe"
    var content: String
}
fileprivate let size = UIScreen.main.bounds.size

struct SIdeBarView: View {
    @State private var showChat: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.darkPurple
                .ignoresSafeArea()
            
            Group {
                
                PurpleButton()
                    .offset(x: showChat ? 90 : 0)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showChat.toggle()
                        }
                    }
                ChatInterface(isPresented: $showChat)
                    .offset(x: showChat ? 0 : size.width*0.85+15)
                
                
            }
            .padding(.bottom)
        }
    }
}

struct SIdeBarView_Previews: PreviewProvider {
    static var previews: some View {
        SIdeBarView()
    }
}

struct PurpleButton: View {
    var body: some View {
        Image(systemName: "text.bubble.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: 50)
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .frame(width: 90, height: 70)
            .background(Color.lightPurple)
            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
    }
}

struct TopheaderView: View {
    let didCancel: () -> ()
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "arrow.left.to.line")
                .foregroundColor(.white)
                .frame(width: 28, height: 20)
                .background(Color.lightPurple.opacity(0.8))
                .cornerRadius(5)
            
            Image(systemName: "minus")
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .background(Color.lightPurple.opacity(0.8))
                .cornerRadius(3)
                .onTapGesture(perform: didCancel)
        }
        .padding(5)
    }
}

struct AvatarView: View {
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .padding(8)
            .frame(width: 45, height: 45)
            .background(Color.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.green, lineWidth: 2)
            )
    }
}

struct ChatInterface: View {
    @Binding var isPresented: Bool
    @State private var messages: [Message] = [
        Message(content:"What the heck just\n happened.")
    ]
    
    @State private var message: Message = Message(content: "")
    
    var body: some View {
        VStack {
            TopheaderView() {
                withAnimation(.spring()) {
                    isPresented.toggle()
                }
            }
            
            HStack {
                AvatarView()
                Text("1/1 online")
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            Divider()
                .frame(height: 1)
                .background(Color.lightPurple)
            
            
            VStack(alignment: .leading) {
                Text("PROTIP: ")
                    .foregroundColor(.green)
                    + Text("Click the \(Image(systemName: "arrow.left.to.line").renderingMode(.template)) icon to move the chat.")
                    .foregroundColor(.white)
                
                ScrollView {
                    VStack {
                        ForEach(messages, content: MessageView.init)
                    }
                    .padding(.leading, 8)
                }
                
                
                Spacer()
            }
            
            Divider()
                .frame(height: 1)
                .background(Color.lightPurple)
            
            TextField("Start typing here...", text: $message.content) { (_) in
                
            } onCommit: {
                if message.content.count > 3 {
                    messages.append(message)
                    message = Message(content: "")
                }
            }
            .foregroundColor(Color(.darkGray))
            .padding(8)
        }
        .frame(width: size.width*0.85, height:size.height*0.65)
        .background(Color(red: 0.05, green: 0.062, blue: 0.118))
        .padding(5)
        .padding(.trailing, 15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.lightPurple, lineWidth: 2)
        )
        .offset(x: 15)
    }
    
}

struct MessageView: View {
    fileprivate let message: Message
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(message.author)
                .foregroundColor(.gray)
                .padding(.leading, 30)
            
            Text(message.content)
            
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 6)
        .foregroundColor(.white)
        .frame(width: size.width * 0.75, alignment: .leading)
        .overlay(
            
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.green, lineWidth: 1.5)
        )
        .overlay(
            AvatarView()
                .offset(x: -6, y: -22)
            , alignment: .topLeading
        )
        .padding(.top, 22)
    }
}
