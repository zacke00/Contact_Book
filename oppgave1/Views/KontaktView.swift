//
//  KontakterView.swift
//  oppgave1
//
//  Created by zakaria berglund on 13/09/2023.
//

import SwiftUI

struct KontaktView: View {
    
    @State var kontakter: Kontakter
    @State var isPresentingEditKontaktView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ZStack {
                        HStack {
                            Spacer()
                            Button {
                                isPresentingEditKontaktView = true
                            } label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color(UIColor.Dark_HeadColor))
                            }
                            .padding()
                        }
                        .sheet(isPresented: $isPresentingEditKontaktView) {
                            EditKontaktView(kontakt: kontakter) { kontakter in
                                isPresentingEditKontaktView = false
                            }
                        }
                        .padding()
                        
                        Circle()
                            .frame(width: 150)
                        
                        Image(uiImage: kontakter.KontaktStart)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)
                            .cornerRadius(100)
                    }
                }
                .frame(height: 170)
                
                Text("\(kontakter.name) \(kontakter.surName)")
                    .foregroundColor(Color(UIColor.Dark_HeadColor))
                    .font(.largeTitle)
                
                ScrollView {
                    KontaktInfo(kontakter: kontakter)
                }
                .background(Color(UIColor.Dark_SecondaryColor))
            }
            .background(Color(UIColor.Dark_SecondaryColor))
        }
    }
}

struct KontakterView_Previews: PreviewProvider {
    static var previews: some View {
        KontaktView(kontakter: .init(name: "simon", surName: "jason", description: "from somewhere", number: "+47 930 10 877", image: []))
    }
}

struct KontaktInfo: View {
    @State var kontakter: Kontakter
    
    var body: some View {
        Group {
            HStack {
                Spacer()
                Image(systemName: "info.square.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding()
                    .foregroundColor(Color(UIColor.Dark_HeadColor))
                Spacer()
                Text("\(kontakter.description)")
                    .padding()
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "phone")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(UIColor.Dark_HeadColor))
                Spacer()
                Text(verbatim: "\(kontakter.number)")
                    .font(.title3)
                Spacer()
            }
        }
        .padding()
        .foregroundColor(Color(UIColor.Dark_HeadColor))
    }
}

struct ButtonImageForEditKontakt: View {
    var body: some View {
        Image(systemName: "pencil")
            .resizable()
            .frame(width: 30, height: 30)
            .padding()
    }
}
