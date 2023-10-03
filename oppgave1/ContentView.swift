//
//  ContentView.swift
//  oppgave1
//
//  Created by zakaria berglund on 12/09/2023.
//

import SwiftUI



struct ContentView: View {
    var favorites: Binding<[Kontakter]>
    
    init(kontakter: [Kontakter], favorites: Binding<[Kontakter]>) {
        self.kontakter = kontakter
        self.favorites = favorites
    }
    @State var hasBeenAddedToFav:Bool = false
    @State var kontakter: [Kontakter]
    
    var body: some View {
        
        
            NavigationStack{
                ZStack{
                    Color(UIColor.HeadColor).ignoresSafeArea()
                    VStack {
                        HStack{
                            Text("Kontakter").font(.custom("Kontakter", fixedSize: 50))
                            Spacer()
                            NavigationLink{
                                AddKontaktView()
                            } label: {
                                EditView()
                            }.frame(width: 50, height: 50)
                        }.padding()
                        List {
                            
                            ScrollView{
                                ForEach(kontakter) { kontakt in
                                    HStack{
                                        HStack{
                                            NavigationLink{
                                                VStack{
                                                    KontakterView(kontakter: kontakt)
                                                }//VStack
                                            } label: {
                                                KontaktList(kontakter: kontakt)
                                            }//NavStack
                                        }//HStack
                                        Spacer()
                                        HStack{
                                            
                                            AddToFavoriteView(favButtonTapped: {
                                                
                                                
                                                if let index = favorites.wrappedValue.firstIndex(where: { $0.name == kontakt.name && $0.surName == kontakt.surName }) {
                                                    
                                                    favorites.wrappedValue.remove(at: index)
                                                } else {
                                                    
                                                    favorites.wrappedValue.append(kontakt)
                                                }
                                            }, isFavorite: {
                                                
                                                if let isFav = favorites.wrappedValue.firstIndex(where:
                                                {
                                                    $0.name == kontakt.name && $0.surName == kontakt.surName
                                                }){
                                                    return true
                                                }else {
                                                    return false
                                                }

                                                
                                            })
                                            
                                            //AddToFavoriteView
                                            
                                            
                                            
                                            
                                            
                                            
                                        } // Hstack inside HStack for buttons
                                        
                                    }// HStack inside ScrollView
                                    
                                
                                }// foreach inside ScrollView
                            }.padding(0) // ScrollView inside List
                        }//List inside VStack
                        
                    } // VStack inside ZStack
                } // ZStack inside NavStack
                
            }//NavStack inside Vstack
            .foregroundColor(Color(UIColor.SecondaryColor))
        
    }//Body
    
} // View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(kontakter: Kontakter.demoKontakter, favorites: .constant([]))
    }
}

struct KontaktList: View {
    
    let kontakter: Kontakter
    var body: some View {
        VStack{
            HStack{
                Image(kontakter.image)
                Text(kontakter.name).font(.title).foregroundColor(.black)
                Text(kontakter.surName).font(.title).foregroundColor(.black)
                
            }.padding(.leading, 0).padding(.top, 10).padding(.bottom, 10)
        }
    }
    
}

