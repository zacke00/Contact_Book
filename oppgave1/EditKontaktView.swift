//
//  EditKontaktView.swift
//  oppgave1
//
//  Created by zakaria berglund on 14/09/2023.
//

import SwiftUI

struct EditKontaktView: View {
    var didEditProdukt: ((Kontakter)-> ())
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink{
                    Image(systemName: "pencil").resizable().scaledToFit()
                    
                } label: {
                    
                }
                }
        }
    }
}

struct EditKontaktView_Previews: PreviewProvider {
    static var previews: some View {
        EditKontaktView  { Kontakter in
            
        }
    }
}
