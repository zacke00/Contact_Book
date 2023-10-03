//
//  Kontakter.swift
//  oppgave1
//
//  Created by zakaria berglund on 12/09/2023.
//

import Foundation



struct Kontakter: Identifiable, Codable{
    let id: UUID = UUID()
    let name: String
    let surName: String
    let description:String
    let number: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case name
        case surName
        case description
        case number
        case image
        case id
    }
}


extension Kontakter{
    static let demoKontakter = [
        Kontakter.init(name: "Zacke", surName: "Berglund", description: "", number: "+47 754 44 223", image: "a"),
        Kontakter.init(name: "Malin", surName: "Granly", description: "", number: "+47 927 25 293", image: "a"),
        Kontakter.init(name: "Caroline", surName: "Vannebo", description: "", number: "+47 930 10 940", image: "a"),

        Kontakter.init(name: "Trym", surName: "Frøystein", description: "", number: "+47 930 50 332", image: "a")
    ]
}
