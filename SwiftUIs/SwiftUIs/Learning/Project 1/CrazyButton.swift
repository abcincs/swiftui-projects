//
//  CrazyButton.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/27/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyButton: View {
    @State var showText = false
    var body: some View {
        VStack {
            Text("Show all  ")
                .truncationMode(.head)
                .lineLimit(1)
                .padding(.vertical)
                .padding(.horizontal)
                .overlay(
                    Ellipse()
                        .trim(from: 0.5, to: 1)
                        .stroke(Color.red, lineWidth: 1)
                        
                )
                .background(!self.showText ? Color.white : Color.yellow)
                .padding(.horizontal)
                .background(Color.red)
                .padding(.horizontal)
                .background(Color.green)
                .padding(.horizontal,8)
                .background(Color.blue)
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(50)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.showText.toggle()
                    }
            }
        }
    }
}


struct CrazyButton_Previews: PreviewProvider {
    static var previews: some View {
        CrazyButton()
    }
}
