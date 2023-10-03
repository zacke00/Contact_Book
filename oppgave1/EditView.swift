//
//  EditView.swift
//  oppgave1
//
//  Created by zakaria berglund on 13/09/2023.
//

import SwiftUI

struct EditView: View {
    
    
    
    var body: some View {
        NavigationStack{
            NavigationLink{
                HStack{
                    AddKontaktView()
                }
            } label: {
                Image(systemName: "person.badge.plus").resizable().scaledToFit()
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
