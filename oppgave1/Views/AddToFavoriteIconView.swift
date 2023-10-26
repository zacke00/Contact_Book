//
//  AddToFavoriteView.swift
//  oppgave1
//
//  Created by zakaria berglund on 26/09/2023.
//

import SwiftUI

struct AddToFavoriteIconView: View {
    var favButtonTapped: (() -> ())

    var isFavorite: () ->Bool

    init(
        favButtonTapped: @escaping (() -> ()),
        isFavorite: @escaping () -> Bool
    ) {
        self.favButtonTapped = favButtonTapped
        self.isFavorite = isFavorite
    }


    
    var body: some View {
        HStack{
            VStack{
                Image(systemName: isFavorite() ? "star.fill" : "star").foregroundColor(.green)
            }.onTapGesture {
                favButtonTapped()
                

            }

        }
    }
}

struct AddToFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoriteIconView(favButtonTapped: {
            
        },isFavorite: {
            true
        } )
    
    }
}
