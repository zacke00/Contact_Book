//
//  EditKontaktView.swift
//  oppgave1
//
//  Created by zakaria berglund on 14/09/2023.
//

import SwiftUI

struct EditKontaktView: View {
    
    var didEditKontakt: ((Kontakter) -> ())
    @State var kontakt: Kontakter
    
    init(kontakt: Kontakter, didEditKontakt: @escaping (Kontakter) -> Void) {
        self._kontakt = State(initialValue: kontakt)
        self.didEditKontakt = didEditKontakt
        
    }
    
    
    @State var isShowingPhotoPickerView = false
    @State var newKontaktName: String = ""
    @State var newKontaktSurName: String = ""
    @State var newkontaktDescription: String = ""
    @State var newKontaktNumber: String = ""
    @State var newImage: Image?
    
    
    
    func didTappedPhotoPickerButton(){
        isShowingPhotoPickerView = true
    }
    func didSave(){
        
        let kontakt = Kontakter(name: newKontaktName, surName: newKontaktSurName, description: newkontaktDescription, number: newKontaktNumber, image: [] )
        
        didEditKontakt(kontakt)
        
    }
    var body: some View {
        NavigationStack{
            
            VStack{
                if let image = newImage{
                    
                    HStack{
                        image
                            .resizable().frame(width: 200, height: 200).cornerRadius(200)
                        
                            
                        //.frame(width: 10)
                    }
                } else {
                    HStack{
                        Image("\(kontakt.image)").resizable().frame(width: 200, height: 200).cornerRadius(200)
                    }
                }
                //Image("\(kontakt.image)").resizable().frame(width: 200,height: 200).cornerRadius(100)
            }
            VStack{
                
                
                TextField("\(kontakt.name)", text: $newKontaktName).foregroundColor(.black)
                TextField("\(kontakt.surName)", text: $newKontaktSurName).foregroundColor(.black)
                TextField("\(kontakt.number)", text: $newKontaktNumber)
                
                
                Button("Choose Image"){
                    didTappedPhotoPickerButton()
                    
                }.buttonStyle(.borderedProminent)
                
                
                Button("Save"){
                    didSave()
                }.buttonStyle(.borderedProminent)
            }.sheet(isPresented: $isShowingPhotoPickerView) {
                PhotoPickerView(sourceType: .photoLibrary) { image in
                    self.newImage = Image(uiImage: image)
                    print(newImage)
                    isShowingPhotoPickerView = false
                }
                
            }
            
            
            }
        }
    
}

struct EditKontaktView_Previews: PreviewProvider {
    static var previews: some View {
        EditKontaktView(kontakt: Kontakter(name: "", surName: "", description: "", number: "", image: [])) {Kontakter in }
    }
}
