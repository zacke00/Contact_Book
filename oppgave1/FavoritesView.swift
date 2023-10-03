//
//  Favorites.swift
//  oppgave1
//
//  Created by zakaria berglund on 18/09/2023.
//

import SwiftUI

struct Favorites: View {
    
    var favorites: Binding<[Kontakter]>
    
    init(favorites: Binding<[Kontakter]>) {
        self.favorites = favorites
    }
    
    func onAppear() {
        print(favorites)
    }
    var body: some View {
        VStack{
            List{
                ForEach(favorites){ kontakter in
                    HStack{
                        Text("\(kontakter.wrappedValue.name)")
                        Text("\(kontakter.wrappedValue.surName)")
                        Spacer()
                        Text("\(kontakter.wrappedValue.number)")
                        
                    }
                    
                }
                
            }
        }.onAppear{
            onAppear()
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites(favorites: .constant([
            Kontakter(name: "sona", surName: "league", description: "something", number: "10930393", image: "")
        ]))
    }
}
