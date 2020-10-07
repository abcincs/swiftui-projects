//
//  CrazyStarsVars.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/1/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyStarsVars: View {
    
    @State var index = 0
    let timer = Timer.publish(every: 0.2, on: .main, in: .common)
        .autoconnect()    
    
    @State var indexer: Int = 0
    
    @State private var text = "One of the things we still have to shoot is the opening crawl. Shooting that crawl is actually one of the hardest things on these shows. The artwork itself is only about four feet long and maybe a foot wide. The camera is real low to the ground and we use a tilting lens to eliminate a lot of the focus problems. But everything has to be lined up just perfectly and you spend days running through tests. Every little blemish shows up. Any little bump, any little movement of the camera is going to screw up this big 2,000-frame-long take. It's fun, but pure torture. One of the things we still have to shoot is the opening crawl. Shooting that crawl is actually one of the hardest things on these shows. The artwork itself is only about four feet long and maybe a foot wide. The camera is real low to the ground and we use a tilting lens to eliminate a lot of the focus problems. But everything has to be lined up just perfectly and you spend days running through tests. Every little blemish shows up. Any little bump, any little movement of the camera is going to screw up this big 2,000-frame-long take. It's fun, but pure torture."
    
    var body: some View {
        VStack(alignment: .center) {
            CustomTextView(text: $text, textRange: $index)
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .onReceive(timer) { _ in
                    self.index += 16
            }
        }
        .frame(width: 414, height: 950)
        .background(Color.black)        
    }
}



struct CrazyStarsVars_Previews: PreviewProvider {
    static var previews: some View {
        CrazyStarsVars()
    }
}
