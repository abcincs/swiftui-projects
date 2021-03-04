//
//  CrazyDrags.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/28/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyDrags: View {
      @State var dragAmount = CGSize.zero
    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .cornerRadius(20)
                    .rotation3DEffect(.degrees(-Double(dragAmount.width) / 20), axis: (x: 0,y: 1,z: 0))
                    .rotation3DEffect(.degrees(-Double(dragAmount.height) / 20), axis: (x: 1,y: 0,z: 0))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                dragAmount = $0.translation
                        }
                        .onEnded {_ in
                            withAnimation(.spring()) {
                                dragAmount = .zero
                            }
                        }
                )
            }
        }
    }
}

struct CrazyDrags_Previews: PreviewProvider {
    static var previews: some View {
        CrazyDrags()
    }
}
