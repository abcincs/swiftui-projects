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
    private let rows = 3
    private let columns = 3
    var body: some View {
        
        VStack {
            HStack(spacing: 5) {
                Image(systemName: "chart.bar.fill").imageScale(.medium)
                Text("MTN Rwanda").font(.system(size: 18))
                
                Spacer()
                Image(systemName: "lock.fill").imageScale(.medium)
                Spacer()
                Image(systemName: "lock.rotation")
                    .imageScale(.medium)
                
                Image(systemName: "alarm.fill")
                    .imageScale(.medium)
                
                Text("70%").font(.system(size: 18))
                Image(systemName: "battery.100")
                    .imageScale(.medium)
            }
            .padding(.horizontal)
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
                                    .fill(passCode.count <= index ? Color.clear  : Color.white)
                                    .frame(width: 20, height: 20)
                            )
                    }
                }
            }
            
            Spacer().frame(height: 30)
            VStack(alignment: .center) {
                GridStack(rows: rows, columns: columns) { row, column in
                    Circle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 100, height: 100)
                        .blur(radius: 0.5)
                        .overlay(
                            VStack(alignment: .center, spacing: 0) {
                                
                                Text("\(((columns * (row + 1)) + column + 1) - rows)")
                                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                                Text(alphabet[indexFor(row, column)])
                                    .bold()
                            }
                        )
                        .onTapGesture {
                            if passCode.count < 6 {
                                let code = indexFor(row, column)+1
                                passCode.append(code)
                                playSound()
                                
                            }
                        }
                }
                
                
                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 90, height: 90)
                    .blur(radius: 0.5)
                    .overlay(
                        Text("0")
                            .font(.system(size: 45, weight: .semibold, design: .rounded))
                    )
                    .onTapGesture {
                        passCode.append(0)
                        playSound()
                    }
            }
            
            HStack(spacing: 10) {
                Text("Emergency").bold()
                Spacer()
                Text(passCode.count == 0 ? "Cancel" : "Delete").bold()
                    .onTapGesture {
                        if passCode.isEmpty == false {
                            passCode.removeLast()
                            playSound()
                        }
                    }
            }
            .padding(.horizontal, 30)
            .font(.system(size: 22, weight: .medium))
            .padding(.bottom)
        }
        
        .background(
            Image("beach")
                .resizable()
                .blur(radius: 17, opaque: true)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
        )
        .foregroundColor(Color.white)
        .statusBar(hidden: true)
    }
    
    private func indexFor(_ row: Int, _ column: Int) -> Int {
        return  row * 3 + column
    }
    
    private func playSound() {
        let path = Bundle.main.path(forResource: "code.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file...
        }
        
    }
}

struct CrazyPassCode_Previews: PreviewProvider {
    static var previews: some View {
        CrazyPassCode()
    }
}
