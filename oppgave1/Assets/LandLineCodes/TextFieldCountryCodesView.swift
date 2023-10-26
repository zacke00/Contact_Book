//
//  TextFieldCountryCodesView.swift
//  oppgave1
//
//  Created by zakaria berglund on 25/10/2023.
//

import SwiftUI

struct PhoneNumberTextField : View {
    @State var phoneNumber = ""
    @State var y : CGFloat = 150
    @State var countryCode = ""
    @State var countryFlag = ""
    var body: some View {
        ZStack {
            HStack (spacing: 0) {
                Text(countryCode.isEmpty ? "🇦🇺 +61" : "\(countryFlag) +\(countryCode)")
                    .frame(width: 80, height: 50)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(countryCode.isEmpty ? .secondary : .black)
                    .onTapGesture {
                        withAnimation (.spring()) {
                            self.y = 0
                        }
                }
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .frame(width: 200, height: 50)
                    .keyboardType(.phonePad)
            }.padding()
            
            CountryCodesView(countryCode: $countryCode, countryFlag: $countryFlag, y: $y)
                .offset(y: y)
            
            RoundedRectangle(cornerRadius: 10).stroke()
            .frame(width: 280, height: 50)
        }
    }
}

struct TextFieldCountryCodesView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberTextField()
    }
}
