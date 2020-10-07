//
//  CharacterView.swift
//  SwiftUIExamples
//
//  Created by Cedric Bahirwe on 9/14/20.
//  Copyright © 2020 Cedric Bahirwe. All rights reserved.
//

import SwiftUI

var characters = Bundle.main.decode([Character].self, from: "avengers.json")

struct CharacterView: View {
    
    @State private var animate  = false
       @Environment(\.imageCache) var cache: ImageCache
       
       @State private var isCharacterPresented = false
       @State private var presentedCharacter: Character?
       
       let links = characters.map { $0.imageurl }
    var body: some View {
        GeometryReader { geometry in
//            NavigationView {
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
                            cache: self.cache,
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
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .onTapGesture {
                        //
                        self.presentedCharacter = character
                        self.isCharacterPresented.toggle()
                        print(character)
                    }
                        
                    .sheet(isPresented: self.$isCharacterPresented) {
                        CharacterDetail(character: self.presentedCharacter!)
                    }
                }
//                .navigationBarTitle(Text("All Characters").bold().foregroundColor(.red))
//                .navigationBarItems(trailing:
//                    Image("learn6")
//                        .resizable()
//                        .frame(width: 80, height: 30)
//                        .mask(
//                            Text("CBahirwe").bold()
//                    )
//                )
                
//            }
                
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
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

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let configuration: (Image) -> Image
    
    init(url: URL, cache: ImageCache? = nil, placeholder: Placeholder? = nil, configuration: @escaping (Image) -> Image = { $0 }) {
        loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
        self.configuration = configuration
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                configuration(Image(uiImage: loader.image!))
            } else {
                placeholder
            }
        }
    }
}
