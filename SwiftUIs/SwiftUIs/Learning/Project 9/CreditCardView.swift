//
//  CreditCardView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/17/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CreditCardView: View {
    
    @State var text: String = "5304464212345678"
    @State var mainColor = Color(red: 0.146, green: 0.183, blue: 0.22)
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Image("chip")
                    .resizable()
                    .frame(width: 50, height: 35)
                    .offset(x: 3, y: -2)
                Spacer()
                Text(self.text)
                    .font(.system(size: 18, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.white)
                    .padding(.leading, 8)
                HStack(spacing: 0) {
                    VStack(spacing: 20) {
                        HStack(spacing: 0) {
                            Text("EXPIRES ON")
                                .frame(width: 25)
                                .font(.system(size: 5.5, weight: .light))
                            Text("09/20")
                                .font(.system(size: 16, weight: .light))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text("CEDRIC BAHIRWE")
                            .font(.system(size: 11, weight: .light))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Image("mastercard").resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.white)
                }
                
                
            }
            .foregroundColor(Color.white)
            .padding()
            .padding(.leading)
            .frame(width: 350, height: 250)
            .background(RoundedRectangle(cornerRadius: 20).fill(self.text.isEmpty ? Color(red: 0.146, green: 0.183, blue: 0.22) : self.checkCard(number: self.text)))
            
            VStack {
                CardTextView(text: $text)
                    .frame(width: 350, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
    
    func checkCard(number: String) -> Color {
        var color = self.mainColor
        guard let cardNumber = Int(number.trimmingCharacters(in: .whitespaces)) else {
            print(number.trimmingCharacters(in: .whitespaces))
            return Color(red: 0.146, green: 0.183, blue: 0.22)
        }
        
        withAnimation {
            color = cardNumber <= 500 ? .red : cardNumber <= 1000 ? .yellow : cardNumber <= 2000 ? .green : .black
        }
        return color
        
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView()
    }
}
