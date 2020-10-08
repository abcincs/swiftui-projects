//
//  CloudView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 10/8/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CloudView: View {
    
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State private var offSet = CGSize.zero
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Image("cloud")
                    .foregroundColor(Color(.darkGray).opacity(0.25))
                    .frame(width: 2000, height: 350, alignment: .leading)
                    .offset(x: self.offSet.width)
            }
            .frame(width: 400, alignment: .leading)
            .clipped()
            .onReceive(timer) { _ in
                withAnimation {
                    self.offSet.width -= 20
                }
            }
        }
    }
}

struct CloudView_Previews: PreviewProvider {
    static var previews: some View {
        CloudView()
    }
}
