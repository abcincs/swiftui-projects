//
//  CrazyOverlays.swift
//  SwiftUIs
//
//  Created by Cédric Bahirwe on 02/03/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyOverlays: View {
    private var images = [ "cheese-toastie-thumb", "fresh-baked-croissant-thumb" , "mushroom-tagliatelle-thumb" , "porridge-deluxe-thumb" , "stack-o-pancakes-thumb", "veggie-pizza-thumb" ]
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< images.count ) {
                Image(images[$0])
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

struct CrazyOverlays_Previews: PreviewProvider {
    static var previews: some View {
        CrazyOverlays()
    }
}
