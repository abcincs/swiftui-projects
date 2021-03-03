//
//  CharacterView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/14/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


struct CharacterView: View {
    var characters = Bundle.main.decode([Character].self, from: "avengers.json")
    @Environment(\.imageCache) var cache: ImageCache
    
    @State private var isCharacterPresented = false
    @State private var presentedCharacter: Character = .example
    
    var links: [String]  {
        characters.map { $0.imageurl }
    }

    var body: some View {
        List(characters, id: \.name) { character in
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name: ")
                        + Text(character.name).bold().foregroundColor(.red)
                    Text("Real name: ")
                        + Text(character.realname).bold().foregroundColor(.green)
                    Text("First appearance: ")
                        + Text(character.firstappearance).bold().foregroundColor(.green)
                    
                    Text("From: ")
                        + Text(character.team).bold().foregroundColor(.yellow)
                }
                Spacer()
                AsyncImage(
                    url: URL(string: character.imageurl)!,
                    cache: cache,
                    placeholder: Text("..."),
                    configuration: {
                        $0.resizable()
                    }
                )
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(4)
                .overlay(
                    Circle()
                        .strokeBorder(LinearGradient(gradient: Gradient(colors: [.pink, .purple, .green, .black]), startPoint: .bottomLeading, endPoint: .trailing), lineWidth: 1)
                )
            }
            .padding()
            .background(Color.black.opacity(0.8))
            .foregroundColor(Color.white)
            .cornerRadius(15)
            .onTapGesture {
                presentedCharacter = character
                isCharacterPresented.toggle()
                print(character)
            }
        
            .sheet(isPresented: $isCharacterPresented) {
                CharacterDetail(character: presentedCharacter)
            }
        }
        .navigationBarTitle("All Characters")
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}


struct Character: Codable {
    var name: String
    var realname: String
    var team: String
    var firstappearance: String
    var createdby: String
    var publisher: String
    var imageurl: String
    var bio: String
    
    
    static let example = Character(name: "Cedriic", realname: "Cedric BHr", team: "ABC", firstappearance: "20", createdby: "God", publisher: "BHR", imageurl: "https://www.simplifiedcoding.net/demos/marvel/ironman.jpg", bio: "Spoint at UITableViewAlert For LayoutOutside ViewHierarchy to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view")
    
}
