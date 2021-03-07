//
//  ResultsView.swift
//  Lab10
//
//  Created by Daniel Cubillo on 6/3/21.
//

import SwiftUI

struct ResultsView: View {
    
    var search_pokemon: String
    let targetSize = CGSize(width: 250, height: 250)
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var pokemonlist = [Datum]()
    @State var loading = false
    
    var body: some View {
        
        VStack {
            if pokemonlist.isEmpty == true {
                if loading == false{
                    Text("No Results")
                }else{
                    ProgressView("Downloading…")
                }
            }else{
                
                ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 10) {
                            ForEach(pokemonlist, id: \.self.id){ item in
                                Image(uiImage: item.images.small.load().scalePreservingAspectRatio(targetSize: targetSize))
                                
                            }
                        }
                    }
//                List(pokemonlist, id: \.id) { item in
//                    Image(uiImage: item.images.small.load().scalePreservingAspectRatio(
//                            targetSize: targetSize))
//                    //.frame(width: 200)
//                    //.aspectRatio(contentMode: .fit)
//                }
            }
            
        }.onAppear(perform: loadData)

        
    }
    
    
    func loadData() {
        loading=true
        let url = ( "https://api.pokemontcg.io/v2/cards?q=name:"+search_pokemon)
        //print(url)
        guard let urlObj = URL(string: url) else { loading=false
            return }

        URLSession.shared.dataTask(with: urlObj) {(data, response, error) in
            guard let data = data else { loading=false
                return }

            do {
                let pokedex = try JSONDecoder().decode(api_response.self, from: data)
                pokemonlist=pokedex.data
                loading=false
                //print(pokemonlist)
            } catch let jsonErr{
                loading=false
                print("Error serializing JSON: ", jsonErr)
            }
        }.resume()
    }
    
    
    
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(search_pokemon: "charizard")
    }
}
