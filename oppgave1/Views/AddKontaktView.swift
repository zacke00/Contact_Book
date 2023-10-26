//
//  AddKontaktView.swift
//  oppgave1
//
//  Created by zakaria berglund on 12/09/2023.
//

import SwiftUI

struct AddKontaktView: View {
    
    var didAddKontakt: ((Kontakter) -> ())
    
    init(didAddKontakt: @escaping (Kontakter) -> Void) {
        self.didAddKontakt = didAddKontakt
    }
    @State var y : CGFloat = 150
    @State var countryCode = ""
    @State var countryFlag = ""
    
    @State var isShowingPhotoPickerView = false
    @State var newKontaktName: String = ""
    @State var newKontaktSurName: String = ""
    @State var newkontaktDescription: String = ""
    @State var newKontaktNumber: String = ""
    @State var image: Image? = Image("panda")
    
    
    func AddKontakt() {
    let kontakt = Kontakter(name: newKontaktName, surName: newKontaktSurName, description: newkontaktDescription, number: newKontaktNumber, image: [])
        print(kontakt)
        didAddKontakt(kontakt)
    }
    

    func didTapPhotoPickerButton() {
        isShowingPhotoPickerView = true
    }
    var body: some View {
        ZStack{
            VStack{
                if let image = image {
                    image
                        .resizable().frame(width: 150,height: 150).cornerRadius(100)
                }
                VStack{
                    TextField("Name", text: $newKontaktName)
                        .foregroundColor(Color(UIColor.Dark_HeadColor))
                        .modifier(TextfieldViewModifier())
                        .autocorrectionDisabled()
                    TextField("Surname", text: $newKontaktSurName)
                        .foregroundColor(Color(UIColor.Dark_HeadColor))
                        .modifier(TextfieldViewModifier())
                        .autocorrectionDisabled()
                    TextField("Description", text: $newkontaktDescription)
                        .foregroundColor(Color(UIColor.Dark_HeadColor))
                        .modifier(TextfieldViewModifier())
                        .autocorrectionDisabled()
                    
                    
                    HStack (spacing: -10) {
                        Text(countryCode.isEmpty ? "🇳🇴 +47" : "\(countryFlag) +\(countryCode)")
                            .frame(width: 80, height: 50)
                            .background(Color(hex: 0x666666))
                            .modifier(TextfieldViewModifier())
                            .foregroundColor(countryCode.isEmpty ? Color(UIColor.Dark_HeadColor) : Color(UIColor.Dark_HeadColor))
                            .onTapGesture {
                                withAnimation (.spring()) {
                                    self.y = 0
                                }
                            }
                        TextField("Phone Number", text: $newKontaktNumber)
                            .foregroundColor(Color(UIColor.Dark_HeadColor))
                            .modifier(TextfieldViewModifier())
                            .autocorrectionDisabled()
                    }
                    
                }
                .padding().cornerRadius(10)
                HStack{
                    Button {
                        AddKontakt()
                       
                    } label: {
                        Text("Add kontakt").foregroundColor(.black)
                    }.buttonStyle(.borderedProminent).tint(.yellow).padding()
                    Button{
                        didTapPhotoPickerButton()
                    } label: {
                        Text("Choose Image").foregroundColor(.black)
                    }.buttonStyle(.borderedProminent).tint(.yellow).padding()
                }
            }.ignoresSafeArea()
            .background(Color(UIColor.Dark_SecondaryColor))
            .sheet(isPresented: $isShowingPhotoPickerView) {
                PhotoPickerView(sourceType: .photoLibrary) { image in
                    self.image = Image(uiImage: image)
                    
                    isShowingPhotoPickerView = false
                }
            }
            CountryCodesView(countryCode: $countryCode, countryFlag: $countryFlag, y: $y)
                .offset(y: y)
        }.background(Color(UIColor.Dark_SecondaryColor)).ignoresSafeArea()
    }
}

struct AddKontaktView_Previews: PreviewProvider {
    static var previews: some View {
        AddKontaktView() { kontakter in
            
        }
    }
}

