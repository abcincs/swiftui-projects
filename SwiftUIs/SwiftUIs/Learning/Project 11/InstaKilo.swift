//
//  InstaKilo.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/7/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct InstaKilo: View {
    @State  var selection = 4
    var body: some View {
        TabView(selection: $selection) {
            ChatsView()
                .tabItem {
                    VStack {
                        Image(systemName: "livephoto")
                        Text("Status")
                    }
            }.tag(1)
            ChatsView()
                .tabItem {
                    VStack {
                        Image(systemName: "phone")
                        Text("Calls")
                    }
            }.tag(2)
            ChatsView()
                .tabItem {
                    VStack {
                        Image(systemName: "ellipses.bubble.fill")
                        Text("Chats")
                    }
            }.tag(3)
            ChatsView()
                .tabItem {
                    VStack {
                        Image(systemName: "camera")
                        Text("Camera")
                    }
            }.tag(4)
            ChatsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }.tag(5)
            
        }
    }
}

struct InstaKilo_Previews: PreviewProvider {
    static var previews: some View {
        InstaKilo()
    }
}
