//
//  ChatsView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/7/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        GeometryReader { geo in
            
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {}) {
                        Text("Edit")
                    }
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.pencil")
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Chats")
                        .font(.system(size: 28, weight: .bold))
                    
                    HStack(spacing:5) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        TextField("Search ", text: .constant(""))
                    }
                    .padding([.top, .vertical], 6)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Rectangle().fill(Color.gray).frame(height: 0.2)
                HStack {
                    Button(action: {}) {
                        Text("Broadcast Lists")
                    }
                    Spacer()
                    
                    Button(action: {}) {
                        Text("New Group")
                    }
                }
                .font(.system(size: 16, weight: .light))
                Rectangle().fill(Color.gray).frame(height: 0.2)
                
                
                
                List(0 ..< 25) { item in
                    HStack(alignment: .top) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                            .frame(width: 45, height: 45)
                            .background(Color.gray.opacity(0.6))
                            .clipShape(Circle())
                        
                        
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Candy I.")
                                    .font(.system(size: 12, weight: .semibold))
                                Spacer()
                                Text("6:00 PM")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 12, weight: .light))
                            }
                            Text("✓ Hey Candy, ça va?")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .light))
                        }
                    }
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
