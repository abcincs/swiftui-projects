//
//  CrazyCharts.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 8/31/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CrazyCharts: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.65)
                .stroke(LinearGradient(gradient: Gradient(colors: [.red, .yellow, .purple]), startPoint: .trailing, endPoint: .leading), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: 10, dash: [], dashPhase: 1))
                .frame(width: 160, height: 160)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(LinearGradient(gradient: Gradient(colors: [.green,.purple , .green]), startPoint: .trailing, endPoint: .leading), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: 8, dash: [], dashPhase: 1))
                .frame(width: 200, height: 200)
            
            Circle()
                .trim(from: 0, to: 0.9)
                .stroke(LinearGradient(gradient: Gradient(colors: [.red,.purple ,.yellow, .green]), startPoint: .trailing, endPoint: .leading), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round, miterLimit: 10, dash: [], dashPhase: 1))
                
                .frame(width: 240, height: 240)
            
            Text("70%")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .bold()
        }
        .frame(width: 250, height: 250)
    }
}


struct CrazyCharts_Previews: PreviewProvider {
    static var previews: some View {
        CrazyCharts()
    }
}
