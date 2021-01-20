//
//  CedricView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/20/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CedricView: View {
    let geometry = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [10, 20,2]))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))

        }
        
    }
}

struct CedricView_Previews: PreviewProvider {
    static var previews: some View {
        CedricView()
    }
}
