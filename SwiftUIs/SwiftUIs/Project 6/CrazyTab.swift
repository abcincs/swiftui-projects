//
//  CrazyTab.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/4/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyTab: View {
    
    @State var index = 0
    @State var images = [ "heart", "bookmark",  "star", "grid" ]
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 100, height: 40)
                .transition(.slide)
                .offset(x: CGFloat(self.index * 100))
            
            HStack(spacing: 5) {
                ForEach(0 ..< self.images.count) { index in
                    
                    HStack(spacing: 5) {
                        Image(systemName: self.images[index])
                            .imageScale(.large)
                        Text(index == self.index ? self.images[index].prefix(5).capitalized : "")
                            .transition(.slide)
                        
                    }
                    .foregroundColor(self.index == index ?  .white : .black)
                    .frame(width: 100, height: 40)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.75, dampingFraction: 0.8, blendDuration: 0.1)) {
                            self.index = index
                        }
                    }
                    .foregroundColor(Color.black)
                    
                }
            }
        }
        
    }
}

struct CrazyTab_Previews: PreviewProvider {
    static var previews: some View {
        CrazyTab()
    }
}
