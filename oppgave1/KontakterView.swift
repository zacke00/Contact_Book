//
//  KontakterView.swift
//  oppgave1
//
//  Created by zakaria berglund on 13/09/2023.
//

import SwiftUI

struct KontakterView: View {
    
    @State var kontakter: Kontakter
    @State var isPresentingEditKontaktView: Bool = false;
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    ScrollView{
                        ZStack{
                            HStack{
                                Spacer()
                                Button{
                                    isPresentingEditKontaktView = true;
                                } label: {
                                    Image(systemName: "pencil").resizable().frame(width: 30, height: 30).foregroundColor(.black)
                                }.padding()
                            }.sheet(isPresented: $isPresentingEditKontaktView) {
                                EditKontaktView(){kontakter in
                                    isPresentingEditKontaktView = false;
                                }
                            }.padding()
                            
                            
                            Circle().frame(width: 150)
                            Image(systemName: kontakter.image).resizable().scaledToFit().foregroundColor(.white).frame(width: 100)
                        }
                        
                    }.frame(height: 170)
                }
                
                Text("\(kontakter.name) \(kontakter.surName)").foregroundColor(.black).font(.largeTitle)
                List{
                    KontaktInfo(kontakter: kontakter)
                    
                }
            }
        }
        
        
    }
}


struct KontakterView_Previews: PreviewProvider {
    static var previews: some View {
        KontakterView(kontakter: .init(name: "simon", surName: "jason", description: "from somewhere", number: "+47 930 10 877", image: "") )
    }
}

struct KontaktInfo:View {
    @State var kontakter: Kontakter
    
    var body: some View{
        HStack{
            Image(systemName: "info.square.fill").resizable().frame(width: 40, height: 40).padding().foregroundColor(.gray)
            
            Text("\(kontakter.description)").padding().foregroundColor(.gray)
        }
        HStack{
            Image(systemName: "phone").resizable().frame(width: 40, height: 40).padding().foregroundColor(.gray)
            
            Text(verbatim: "\(kontakter.number)").font(.title3).padding().foregroundColor(.black)
        }
    }
}

struct buttonImageForEditKontakt: View{
    var body: some View{
        Image(systemName: "pencil").resizable().frame(width: 30, height: 30).padding()
    }
    
}
