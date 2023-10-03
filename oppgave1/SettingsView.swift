//
//  Settings.swift
//  oppgave1
//
//  Created by zakaria berglund on 18/09/2023.
//

import SwiftUI
import UIKit

extension UIColor {
    static var SecondaryColor: UIColor {
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static var HeadColor: UIColor {
        return UIColor(red: 0.7, green: 0.6, blue: 0.9, alpha: 1.0)
    }
    
    static var Dark_HeadColor: UIColor{
        return UIColor(red: 0.9, green: 0.66, blue: 0.09, alpha: 1.0)
    }
        
    static var Dark_SecondaryColor: UIColor{
        return UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    }
}

struct Settings: View {
    
    var body: some View {
        VStack{
            Text("Light")
            HStack{
                Circle().foregroundColor(Color(UIColor.SecondaryColor))
                Circle().foregroundColor(Color(UIColor.HeadColor))
            }
            Spacer()
            Text("Dark Color")
            HStack{
                Circle().foregroundColor(Color(UIColor.Dark_HeadColor))
                Circle().foregroundColor(Color(UIColor.Dark_SecondaryColor))
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
