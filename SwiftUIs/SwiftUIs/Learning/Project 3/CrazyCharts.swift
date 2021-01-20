//
//  CrazyCharts.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/31/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct Chart: Identifiable {
    let id = UUID()
    var width: Int
    var height: Int
    var color: Color
}


struct CrazyCharts: View {
    @State var animate = false
    @State var flip = false
    @State var scale = 1
    @State var charts = [Chart(width: 20, height: 100, color: .red), Chart(width: 38, height: 75, color: .pink), Chart(width: 15, height: 85, color: .green), Chart(width: 55, height: 50, color: .purple), Chart(width: 8, height: 75, color: .yellow), Chart(width: 15, height: 85, color: .green), Chart(width: 35, height: 50, color: .purple), Chart(width: 8, height: 75, color: .yellow), Chart(width: 15, height: 85, color: .secondary), Chart(width: 5, height: 50, color: .purple), Chart(width: 8, height: 75, color: .orange), Chart(width: 15, height: 85, color: .green), Chart(width: 5, height: 50, color: .purple), Chart(width: 8, height: 75, color: .yellow), Chart(width: 15, height: 85, color: .pink), Chart(width: 5, height: 50, color: .blue)]
    
       var body: some View {
        VStack {
//            Text("Hello Universe!")
            
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.65)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.red, .yellow, .purple]), startPoint: .trailing, endPoint: .leading), lineWidth: 10)
                .frame(width: 160, height: 160)
                
                Circle()
                .trim(from: 0, to: 0.8)
                .stroke(Color.blue, lineWidth: 8)
                .frame(width: 200, height: 200)
                
                Circle()
                .trim(from: 0, to: 0.9)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.red,.purple
                        ,.yellow, .green]), startPoint: .trailing, endPoint: .leading), lineWidth: 10)
                    
                .frame(width: 240, height: 240)
                
                Text("70%")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .bold()
                
                
                
            }
            .frame(width: 250, height: 250)
            Spacer()
                .frame(height: 150)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 20) {
                    ForEach(self.charts) { chart in
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(chart.color)
                                .frame(width: CGFloat(integerLiteral: chart.width), height: CGFloat(integerLiteral: chart.height * self.scale))
                                .gesture(
                                    LongPressGesture(minimumDuration: 2.0)
                                        .onEnded { _ in
                                            withAnimation {
                                                self.scale *= 2
                                            }
                                    }
                                )
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX)), axis: (0,1,0))
                            
                        }
                        
                        
                    }
                }
                .rotationEffect(.degrees(self.flip ? 180 : 0))
            }
            
            
        Button(action: {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                self.charts = self.charts.reversed()
            }
        }) {
            Text("Inverse")
            }
        }
    }

}


struct CrazyCharts_Previews: PreviewProvider {
    static var previews: some View {
        CrazyCharts()
    }
}
