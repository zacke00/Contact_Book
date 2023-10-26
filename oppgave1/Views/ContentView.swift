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
    @State var isShowingAddKontaktView = false
    
    func didTapAddKontaktButton(){
        isShowingAddKontaktView = true
    }
    
    var body: some View {
        
        
        NavigationStack{
            ZStack{
                Color(UIColor.Dark_SecondaryColor).ignoresSafeArea()
                VStack {
                    HStack{
                        Text("Kontakter").font(.custom("Kontakter", fixedSize: 50)).foregroundColor(Color(UIColor.Dark_HeadColor))
                        Spacer()
                        
                            Button{
                                isShowingAddKontaktView = true
                            } label: {
                            Image(systemName: "person.badge.plus").resizable().scaledToFit()
                        }.frame(width: 50, height: 50)
                    }.padding()
                    Divider().background(Color(UIColor.Dark_HeadColor)).frame(height: 2).padding([.trailing, .leading],20)
                        
                        ScrollView{
                            ForEach(kontakter) { kontakt in
                                HStack{
                                HStack{
                                    NavigationLink{
                                        VStack{
                                            KontaktView(kontakter: kontakt)
                                        }//VStack
                                    } label: {
                                        KontaktList(kontakter: kontakt)
                                    }//NavStack
                                }.background(Color(UIColor.Dark_SecondaryColor))//HStack
                                Spacer()
                                HStack{
                                    
                                    AddToFavoriteIconView(favButtonTapped: {
                                        
                                        
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
                                    })//AddToFavoriteView
                                    
                                } // Hstack inside HStack for buttons
                                
                            }// HStack inside ScrollView
                                
                                
                            }// foreach inside ScrollView
                        }.padding().background(Color(UIColor.Dark_SecondaryColor))
                        .sheet(isPresented: $isShowingAddKontaktView){
                            AddKontaktView(){ kontakt in
                                print(kontakt)
                                kontakter.append(kontakt)
                                isShowingAddKontaktView = false
                            }
                        }// ScrollView inside List
                    
                    
                }
                .foregroundColor(Color(UIColor.Dark_HeadColor)) // VStack inside ZStack
            }.background(Color(UIColor.Dark_HeadColor)) // ZStack inside NavStack
            
        }//NavStack inside Vstack
        .foregroundColor(Color(UIColor.Dark_HeadColor))
        
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
                Image(uiImage: kontakter.KontaktStart).resizable().frame(width: 100,height: 100).cornerRadius(100)
                Text(kontakter.name).font(.title).foregroundColor(Color(UIColor.Dark_HeadColor))
                Text(kontakter.surName).font(.title).foregroundColor(Color(UIColor.Dark_HeadColor))
                
            }.padding(.leading, 0).padding(.top, 10).padding(.bottom, 10).background(Color(UIColor.Dark_SecondaryColor))
        }
    }
    
}

