//
//  AlertView.swift
//  Views
//
//  Created by Cédric Bahirwe on 12/01/2021.
//

import SwiftUI

struct AlertView: View {
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                Text("You are all set to sign \"ARAMBURU\".")
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                Text("Do you want to proceed?")
            }
            
            HStack {
                Text("Cancel")
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(8)
                    .foregroundColor(.blue)
                Spacer()
                Text("Sign")
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.blue.opacity(0.15))
                    .cornerRadius(8)
                    .foregroundColor(.blue)
            }
            .font(.system(size: 16, weight: .semibold, design: .rounded))
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

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
