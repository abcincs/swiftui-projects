//
//  RectangleFieldView.swift
//  Views
//
//  Created by Cédric Bahirwe on 12/01/2021.
//

import SwiftUI

struct RectangleFieldView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Owner Name")
                .font(.system(size: 18, weight: .bold, design: .rounded))
            Text("Your owner name can be changed later. Names that are personally identifiable or infringe on a third party's right are not permitted.")
                .multilineTextAlignment(.center)
                .font(.system(size: 15, weight: .light, design: .rounded))
                .lineSpacing(5)
            TextField("Owner Name", text: .constant(""))
                .padding(.vertical, 3)
                .padding(.leading, 8)
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .overlay( Rectangle().strokeBorder(Color.black))
            
            Button(action: {}, label: {
                Text("OK")
                    .bold()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(8)
            })
            
        }
        .padding()
        .frame(width: 350)
        .padding(.bottom,5)
        .background(Color.white.opacity(0.5))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 3, y: 3)
        .shadow(color: Color.white.opacity(0.7), radius: 3, x: -2, y: -2)
        .foregroundColor(.black)
    }
}

struct RectangleFieldView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleFieldView()
            .previewLayout(.fixed(width: 800, height: 400))

    }
}
