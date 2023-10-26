//
//  oppgave1App.swift
//  oppgave1
//
//  Created by zakaria berglund on 12/09/2023.
//

import SwiftUI

@main
struct oppgave1App: App {
    
    @State var favorites = [Kontakter]()
    @State var kontakter = [Kontakter]()
    
    func onAppear() {
        let fileManager = FileManager()
        do{
            let favfileUrl = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("favorites.json")
            let data = try Data.init(contentsOf: favfileUrl)
           // print(data)
            let decoder = JSONDecoder()
            self.favorites = try decoder.decode([Kontakter].self, from: data)
            //print("Printing the file url: \(favfileUrl)")
        } catch let error{
            print(error)
        }
    }
    
    func favoritesOnAppear() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(favorites)
            let fileManager = FileManager.default
            
            let documents = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("favorites.json")
            try data.write(to: documents)
        }catch let error {
            print(error)
        }
    }
    
    
    var body: some Scene {
        WindowGroup {
            TabView{
                Group{
                    ContentView(kontakter: Kontakter.demoKontakter, favorites: $favorites)
                        .tabItem {
                            Label("Kontakter", systemImage: "book.fill")
                        }

                    FavoritesView(favorites: $favorites)
                        .tabItem {
                            Label("Favorites", systemImage: "star.fill")
                        }.background(Color(UIColor.Dark_SecondaryColor))
                        .onAppear{
                            favoritesOnAppear()
                        }
                    Settings()
                        .tabItem{
                            Label("Settings", systemImage: "square.and.pencil")
                        }
                }
                .toolbar(.visible, for: .tabBar)
                 
                
            }
            .onAppear{
                UITabBar.appearance().backgroundColor = UIColor.Dark_SecondaryColor
                UITabBar.appearance().unselectedItemTintColor = UIColor.gray
                onAppear()
            }
        }
    }
}
