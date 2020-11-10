//
//  ContentView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/7/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CedricView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 816, height: 410))
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

