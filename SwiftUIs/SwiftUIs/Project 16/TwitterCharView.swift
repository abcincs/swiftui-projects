//
//  TwitterCharView.swift
//  SwiftUIs
//
//  Created by Cedric Bahirwe on 11/9/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct TwitterCharView: View {
    let geometry = UIScreen.main.bounds.size
    @State private var count: String = "0.0"
    @State private var progress: CGFloat = 0.0
    @State private var text = ""
    
    let average = 260
    let max = 280
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            ZStack {
                if self.text.count < average {
                    Circle()
                        .trim(from: 0.0, to: 1.0)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .opacity(0.3)
                        .frame(width: geometry.width/2, height:geometry.width/2)
                    
                    
                    Circle()
                        .trim(from: 0.0, to: self.progress)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        .frame(width: geometry.width/2, height:geometry.width/2)
                        .rotationEffect(.degrees(-90))
                    
                } else {
                    if (max-text.count) > -10 {
                        Circle()
                            .trim(from: 0.0, to: self.progress)
                            .stroke((max-text.count) <= 0 ? Color.red : Color.orange, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                            .frame(width: geometry.width/1.8, height:geometry.width/1.8)
                            .rotationEffect(.degrees(-90))
                    }
                    Text((max-text.count).description)
                        .lineLimit(1)
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor((max-text.count) <= 0 ? Color.red : Color.gray)
                        .frame(width: 200)
                        .minimumScaleFactor(0.5)
                }
            }
            TextField("", text: $text.onChange({ value in
                self.progress = CGFloat(value.count)/280.0
            }))
                .padding(10)
                .background(Color.red.opacity(0.1))
                .padding(10)
            
        }
        //        .onReceive(timer) { value in
        //            if self.progress < 1.0 {
        //                withAnimation {
        //                    self.count = String(format: "%.1f", self.progress)
        //                    self.progress += 0.1
        //                }
        //            } else {
        //                self.timer.upstream.connect().cancel()
        //            }
        //        }
    }
}

struct TwitterCharView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterCharView()
    }
}
