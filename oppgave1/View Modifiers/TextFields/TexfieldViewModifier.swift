//
//  TexfieldViewModifier.swift
//  oppgave1
//
//  Created by zakaria berglund on 25/10/2023.
//

import SwiftUI

struct TextfieldViewModifier: ViewModifier {
    func body(content: Content) -> some View {
//        ZStack {
//            Color.red
            
        content
            
            .frame(height: 20)
            .padding()
            .background(Color(hex: 0x666666))
            .cornerRadius(20)
            
            
            .padding()
                
//        }
    }
}

private struct TextfieldViewModifierPreview: View {
    @State var nameText = ""
    @State var phoneText = ""
    @State var phoneText2 = ""
    var body: some View {
        VStack {
            TextField("Navn", text: $nameText)
                .modifier(TextfieldViewModifier())
                .padding()
            
            HStack {
                TextField("Telefonnummer", text: $phoneText)
                    .modifier(TextfieldViewModifier())
                    .padding()
                
                TextField("Telefonnummer", text: $phoneText2)
                    .modifier(TextfieldViewModifier())
                    .padding()
                    
                    
            }
        }
    }
}

extension View {
    
    var TexfieldViewModifier: some View {
//        return self
//        self
            modifier(TextfieldViewModifier())
        
//        modifier(CoolTextFieldStyle())
    }
}

struct TextfieldViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldViewModifierPreview()
    }
}
