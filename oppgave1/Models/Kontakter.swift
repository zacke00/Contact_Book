//
//  Kontakter.swift
//  oppgave1
//
//  Created by zakaria berglund on 12/09/2023.
//

import Foundation
import UIKit

struct Kontakter: Identifiable, Codable{
    let id: UUID = UUID()
    let name: String
    let surName: String
    let description:String
    let number: String
    let image: [KontaktImage]

    enum CodingKeys: String, CodingKey {
        case name
        case surName
        case description
        case number
        case image
        case id
    }
    
    var KontaktStart: UIImage{
        return UIImage(named: "panda")!
    }
}


extension Kontakter{
    static let demoKontakter = [
        Kontakter.init(name: "Zacke", surName: "Berglund", description: "", number: "+47 754 44 223", image: []),
        Kontakter.init(name: "Malin", surName: "Granly", description: "", number: "+47 927 25 293", image: []),
        Kontakter.init(name: "Caroline", surName: "Vannebo", description: "", number: "+47 930 10 940", image: []),

        Kontakter.init(name: "Trym", surName: "Frøystein", description: "", number: "+47 930 50 332", image: [])
    ]
}
