//
//  RectangleView.swift
//  Views
//
//  Created by Cédric Bahirwe on 12/01/2021.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 60,height: 60)
                .background(Color.white)
                .foregroundColor(.green)
                .clipShape(Circle())
                .padding(.top, 10)
            Text("Title goes here!")
                .font(.system(size: 16, weight: .semibold, design: .rounded))
            
            VStack {
                Text("And the subtitle starts and follow")
                Text("down here till the end.")
            }
            .font(.system(size: 14, weight: .light, design: .rounded))
            .padding(.vertical, 5)
            
            Button(action: {}, label: {
                Text("OK")
                    .bold()
                    .foregroundColor(.blue)
                    .frame(width: 280)
                    .frame(height: 40)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            })

        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
        .shadow(color: Color.white.opacity(0.7), radius: 3, x: -2, y: -2)
        .foregroundColor(.black)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
