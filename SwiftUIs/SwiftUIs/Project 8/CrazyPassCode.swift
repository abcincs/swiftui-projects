//
//  CrazyPassCode.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/10/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI
import AVFoundation

struct CrazyPassCode: View {
    @State var bombSoundEffect: AVAudioPlayer?
    
    @State private var alphabet = ["", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"]
    @State private var passCode: [Int] =  [Int]()
    @State var row = 3
    @State var column = 3
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "chart.bar.fill")
                        .imageScale(.medium)
                    Text("MTN Rwanda").font(.system(size: 20))
                    
                    
                    Spacer()
                    Image(systemName: "lock.fill")
                        .imageScale(.medium)
                    Spacer()
                    Image(systemName: "lock.rotation")
                        .imageScale(.medium)
                    
                    Image(systemName: "alarm.fill")
                        .imageScale(.medium)
                    
                    Text("70%").font(.system(size: 20))
                    Image(systemName: "battery.100")
                        .imageScale(.medium)
                }
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .padding(.top, -10)
                Spacer()
                VStack(spacing: 25) {
                    Text("Enter Passcode")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.white)
                    HStack(spacing: 30) {
                        ForEach( 0 ..< 6) { index in
                            Circle()
                                .stroke(Color.white, lineWidth: 1.5)
                                .frame(width: 20, height: 20)
                                .overlay (
                                    Circle()
                                        .fill(self.passCode.count <= index ? Color.clear  : Color.white)
                                        .frame(width: 20, height: 20)
                            )
                        }
                    }
                }
                
                Spacer().frame(height: 30)
                VStack(alignment: .center) {
                    GridStack(rows: self.row, columns: self.column) { row, column in
                        Circle()
                            .fill(Color.white.opacity(0.15))
                            .frame(width: 100, height: 100)
                            .blur(radius: 0.5)
                            .overlay(
                                VStack(alignment: .center, spacing: 0) {
                                    Text("\(((self.column * (row + 1)) + column + 1) - self.row)")
                                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                                    Text(self.alphabet[((self.column * (row + 1)) + column) - self.row])
                                        .bold()
                                    
                                }.foregroundColor(Color.white)
                        )
                            .onTapGesture {
                                if self.passCode.count < 6 {
                                    let code = ((self.column * (row + 1)) + column + 1) - self.row
                                    self.passCode.append(code)
                                    self.playSound()
                                    
                                }
                        }
                        
                    }
                    
                    
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 90, height: 90)
                        .blur(radius: 0.5)
                        .overlay(
                            VStack(alignment: .center) {
                                Text("0")
                                    .font(.system(size: 45, weight: .semibold, design: .rounded))
                                
                            }.foregroundColor(Color.white)
                    )
                        .onTapGesture {
                            self.passCode.append(0)
                            self.playSound()
                    }
                }
                
                Spacer()
                HStack(spacing: 10) {
                    Text("Emergency").bold()
                    Spacer()
                    Text(self.passCode.count == 0 ? "Cancel" : "Delete").bold()
                        .onTapGesture {
                            self.passCode.removeLast()
                            self.playSound()
                    }
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.horizontal)
                .font(.system(size: 22, weight: .medium))
                Spacer().frame(height: 20)
            }
                
            .background(Image("beach")
            .resizable()
            .blur(radius: 17, opaque: true)
                
            .frame(width: geometry.size.width, height: 895 + 36)
                //            .edgesIgnoringSafeArea(.all)
            )
        }
    }
    
    func playSound() {
        let path = Bundle.main.path(forResource: "code.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
        
    }
}

struct CrazyPassCode_Previews: PreviewProvider {
    static var previews: some View {
        CrazyPassCode()
    }
}
