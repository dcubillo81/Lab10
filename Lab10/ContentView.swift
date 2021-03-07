//
//  ContentView.swift
//  Lab10
//
//  Created by Daniel Cubillo on 6/3/21.
//

import SwiftUI

struct ContentView: View {

    @State var search: String = ""

    var body: some View {
            
        NavigationView{
            VStack{
                    
                    Text("Pokémon TCG Guru")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    Text("The Ultimate Pokémon Card Database")
                    
                    TextField("Pokemon Name", text: $search)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                        
                    
                    NavigationLink(destination: ResultsView(search_pokemon: search)) {
                        Text("Search")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: 70, minHeight: 0, maxHeight: 70)
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
