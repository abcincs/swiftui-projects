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
    @State var character: Character
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(
                    url: URL(string: self.character.imageurl)!,cache: self.cache,
                    placeholder: Text("..."),
                    configuration: {
                        $0.resizable()
                }
                )
                .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
                .overlay(
                    Text(self.character.publisher)
                    .padding(6)
                        .background(Color.black.opacity(0.3))
                    .offset(x: -5, y: -5)
                    , alignment: .bottomTrailing
                )
                    
                    .cornerRadius(40, corners: [.bottomLeft])
                
                Text(self.character.name).font(.largeTitle).foregroundColor(Color.offWhite)  + Text(" \(self.character.firstappearance)").foregroundColor(.red)
                HStack {
                    Text("By: ") + Text(self.character.createdby).foregroundColor(.green)
                    Text("Team: ") + Text(self.character.team).foregroundColor(.green)
                }.padding()
                ScrollView(.vertical, showsIndicators: false) {
                    Text(self.character.bio.trimmingCharacters(in: .newlines).trimmingCharacters(in: .whitespaces))
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
        CharacterDetail(character: Character(name: "Captain America", realname: "Steve Rogers", team: "Avengers", firstappearance: "1941", createdby: "Joe Simon", publisher: "Marvel Comics", imageurl: "https://www.simplifiedcoding.net/demos/marvel/captainamerica.jpg", bio: """
            \r\n\t\tSteven Rogers was born in the Lower East Side of Manhattan, New York City, in 1925 to poor Irish immigrants, Sarah and Joseph Rogers.[54] Joseph died when Steve was a child, and Sarah died of pneumonia while Steve was a teen. By early 1940, before America's entry into World War II, Rogers is a tall, scrawny fine arts student specializing in illustration and a comic book writer and artist.\r\n\t\t
            """))
    }
}
#endif

