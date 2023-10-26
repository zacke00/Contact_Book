//
//  FavoriteKontaktView.swift
//  oppgave1
//
//  Created by zakaria berglund on 26/10/2023.
//

import SwiftUI

struct FavoriteKontaktView: View {
    
    @Binding var favorites: Kontakter
    
    var body: some View {
        VStack{
            Text("Hellu")
            Text("\(favorites.name)")
        }
    }
}

struct FavoriteKontaktView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteKontaktView(favorites: .constant(.init(name: "", surName: "", description: "", number: "", image: [])))
    }
}
