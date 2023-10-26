//
//  Favorites.swift
//  oppgave1
//
//  Created by zakaria berglund on 18/09/2023.
//

import SwiftUI

struct FavoritesView: View {
    
    var favorites: Binding<[Kontakter]>
    
    init(favorites: Binding<[Kontakter]>) {
        self.favorites = favorites
    }
    @State var isShowingKontaktView = false
    
    func onAppear() {
        print(favorites)
    }
    func tappedFavorites(){
        isShowingKontaktView = true
    }
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    ForEach(favorites){ kontakter in
                        
                            HStack{
                                NavigationLink{
                                    
                                    FavoriteKontaktView(favorites: kontakter)
                                    
                                    
                                }label: {
                                    
                                    
                                    Image("\(kontakter.wrappedValue.image)")
                                        .resizable().frame(width: 50,height:50).cornerRadius(50)
                                    Text("\(kontakter.wrappedValue.name)").bold()
                                    Text("\(kontakter.wrappedValue.surName)").bold()
                                    Spacer()
                                    Text("\(kontakter.wrappedValue.number)")
                                }
                            }
                        .padding([.trailing, .leading], 20)
                        .background(Color(UIColor.gray))
                        .cornerRadius(30)
                        .padding()
                    }
                    
                }.background(Color(UIColor.Dark_SecondaryColor))
            }
            .onAppear{
                onAppear()
            }
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favorites: .constant([
            Kontakter(name: "sona", surName: "league", description: "something", number: "10930393", image: [])
        ]))
    }
}
