//
//  AlertFinishView.swift
//  Views
//
//  Created by Cédric Bahirwe on 12/01/2021.
//

import SwiftUI

struct AlertFinishView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 2) {
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Text("You're now ready to go!")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            
            Text("Let's create your ideal team.")
                .font(.system(size: 16, weight: .light, design: .rounded))
            
            Button(action: {}, label: {
                Text("OK")
                    .bold()
                    .foregroundColor(.blue)
                    .frame(width: 280)
                    .frame(height: 40)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(8)
            })
        }
        .padding()
        .frame(width: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
        .shadow(color: Color.white.opacity(0.7), radius: 3, x: -2, y: -2)
        .foregroundColor(.black)
    }
}

struct AlertFinishView_Previews: PreviewProvider {
    static var previews: some View {
        AlertFinishView()
            .previewLayout(.fixed(width: 350, height: 200))
            .preferredColorScheme(.dark)
    }
}
