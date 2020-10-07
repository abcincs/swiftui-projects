//
//  CrazyView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/9/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyView: View {
    @State var index = 0
    @State var animate = false
    
    @State var today = Date()
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "list.bullet")
                    .imageScale(.large)
                Spacer()
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                
            }
            Spacer()
                .frame(height: 30)
            
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 100)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange.opacity(0.5), Color.orange.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    Text("This Low Could Make Google & Facebook More And Change information is needed.")
                        .lineSpacing(5)
                        .lineLimit(3)
                        .frame(maxWidth: .infinity)
                    
                    HStack {
                        Text("DESIGN")
                            .bold()
                            .foregroundColor(Color.orange)
                        Spacer()
                        Text("2 hr ago")
                            .foregroundColor(Color(.darkGray))
                    }
                    .padding([.horizontal])
                    .padding(.top, 8)
                }
            }
            Spacer().frame(height: 30)
            
            //            VStack(alignment: .leading, spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0 ..< 18) { index in
                        
                        ZStack(alignment: .bottom) {
                            Image("learn" + String(index))
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            //                            .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 10)
                            
                            VStack(alignment: .leading) {
                                Text("This Law Could Make Google Accountable information")
                                    .font(.system(size: 22, weight: .regular, design: .rounded))
                                Spacer()
                                    .frame(height: 15)
                                HStack {
                                    Text("FREELANCER").bold().foregroundColor(Color.orange)
                                    Spacer()
                                    Text("Mark 12, 2020").foregroundColor(Color(.darkGray))
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                            
                        }
                        .frame(width: 300)
                        
                        //                .frame(minWidth: 400, maxWidth: .infinity, minHeight: 0, maxHeight: 500)
                    }
                    
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CrazyView_Previews: PreviewProvider {
    static var previews: some View {
        CrazyView()
    }
}
