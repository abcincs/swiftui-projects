//
//  DotStrokeView.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 25/05/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct DotStrokeView: View {
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

struct DotStrokeView_Previews: PreviewProvider {
    static var previews: some View {
        DotStrokeView()
    }
}
