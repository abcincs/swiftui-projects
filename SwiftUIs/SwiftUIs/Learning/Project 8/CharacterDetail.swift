//
//  CharacterDetail.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/11/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

struct CharacterDetail: View {
    @Environment(\.imageCache) var cache: ImageCache
    var character: Character
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(
                    url: URL(string: character.imageurl)!,cache: cache,
                    placeholder: Text("..."),
                    configuration: {
                        $0.resizable()
                }
                )
                .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
                .overlay(
                    Text(character.publisher)
                    .padding(6)
                        .background(Color.black.opacity(0.3))
                    .offset(x: -5, y: -5)
                    , alignment: .bottomTrailing
                )
                    
                    .cornerRadius(40, corners: [.bottomLeft])
                
                Text(character.name).font(.largeTitle).foregroundColor(.offWhite)  + Text(" \(character.firstappearance)").foregroundColor(.red)
                HStack {
                    Text("By: ") + Text(character.createdby).foregroundColor(.green)
                    Text("Team: ") + Text(character.team).foregroundColor(.green)
                }.padding()
                ScrollView(.vertical, showsIndicators: false) {
                    Text(character.bio.trimmingCharacters(in: .newlines).trimmingCharacters(in: .whitespaces))
                        .padding(.horizontal)
                }
            }
            .foregroundColor(Color.white)
            .background(Color.black.opacity(0.85).edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.top)
            
        }
    }
}


#if DEBUG
struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetail(character: .example)
    }
}
#endif

