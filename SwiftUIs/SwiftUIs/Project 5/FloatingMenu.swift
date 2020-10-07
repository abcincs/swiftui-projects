//
//  FloatingMenu.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/3/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct FloatingMenu: View {
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    var body: some View {
        VStack {
            Spacer()
            if showMenuItem1 {
                MenuThing(icon:"camera.fill")
                    .transition(.offset())
            }
            
            if showMenuItem2 {
                MenuThing(icon:"photo.on.rectangle")
                    .transition(.slide)
            }
            
            if showMenuItem3 {
                MenuThing(icon:"square.and.arrow.up.fill")
                    .transition(.slide)
            }
            
            Button(action: {
                print("Delete button tapped!")
                self.showMenu()
            }) {
               Image(systemName: "plus.circle.fill")
               .resizable()
               .frame(width: 80, height: 80)
               .foregroundColor(Color(red: 100/255, green: 200/255, blue: 100/255))
               .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                
                }
            .rotationEffect(Angle(degrees: self.showMenuItem3 ? 45 : 0))
            .rotation3DEffect(Angle(degrees: self.showMenuItem1 ? 30 : 0), axis: (x: 10, y: 0, z: 0))
        }
    }
    
    func showMenu() {
        withAnimation {
            showMenuItem3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.showMenuItem2.toggle()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.showMenuItem1.toggle()
        })
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}

struct MenuThing: View {
    var icon: String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 100/255, green: 200/255, blue: 100/255))
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        .transition(.move(edge: .bottom))
    }
}
