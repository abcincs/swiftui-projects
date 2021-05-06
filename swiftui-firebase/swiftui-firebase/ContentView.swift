//
//  ContentView.swift
//  swiftui-firebase
//
//  Created by Cédric Bahirwe on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    

                VStack {
                    TextField("Email", text: .constant(""))
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    SecureField("Password", text: .constant(""))
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    Button(action: {
                        
                    }) {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(8)
                    }
                }
                .padding()
                Spacer()

            }
            .navigationTitle("Sign In")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
