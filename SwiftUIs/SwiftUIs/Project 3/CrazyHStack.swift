//
//  CrazyHStack.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/31/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyHStack: View {
    
    var images = [ "cheese-toastie-thumb", "fresh-baked-croissant-thumb" , "mushroom-tagliatelle-thumb" , "porridge-deluxe-thumb" , "stack-o-pancakes-thumb", "veggie-pizza-thumb" ]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< self.images.count ) {
                Image(self.images[$0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(2)
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(.leading, -15)
            }
            
        }
        .rotationEffect(.degrees(180))
    }
}


struct CrazyHStack_Previews: PreviewProvider {
    static var previews: some View {
        CrazyHStack()
    }
}
