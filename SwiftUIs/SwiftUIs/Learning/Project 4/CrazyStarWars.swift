//
//  CrazyStarWars.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 02/03/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyStarWars: View {
    @State private var index = 90
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
    @State private var text = "One of the things we still have to shoot is the opening crawl. Shooting that crawl is actually one of the hardest things on these shows. The artwork itself is only about four feet long and maybe a foot wide. The camera is real low to the ground and we use a tilting lens to eliminate a lot of the focus problems. But everything has to be lined up just perfectly and you spend days running through tests. Every little blemish shows up. Any little bump, any little movement of the camera is going to screw up this big 2,000-frame-long take. It's fun, but pure torture. One of the things we still have to shoot is the opening crawl. Shooting that crawl is actually one of the hardest things on these shows. The artwork itself is only about four feet long and maybe a foot wide. The camera is real low to the ground and we use a tilting lens to eliminate a lot of the focus problems. But everything has to be lined up just perfectly and you spend days running through tests. Every little blemish shows up. Any little bump, any little movement of the camera is going to screw up this big 2,000-frame-long take. It's fun, but pure torture."
    
    var body: some View {
        VStack(alignment: .center) {
            CustomTextView(text: $text, textRange: $index)
                .edgesIgnoringSafeArea(.all)
                .padding(20)
                .frame(height: 1500)
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .offset(y: -20)
                .onReceive(timer) { _ in
                    withAnimation {
                        index += 3
                    }
                    if index > 900 {
                        index = 90
                    }
                }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct CrazyStarWars_Previews: PreviewProvider {
    static var previews: some View {
        CrazyStarWars()
    }
}
