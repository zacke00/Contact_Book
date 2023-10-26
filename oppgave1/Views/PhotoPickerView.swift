//
//  PhotoPickerView.swift
//  oppgave1
//
//  Created by zakaria berglund on 17/10/2023.
//

import SwiftUI

struct PhotoPickerView: UIViewControllerRepresentable{
    
    var didPickImage: ((UIImage) -> Void)?
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
       
        var didPickImage: ((UIImage) -> Void)?
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            print(info)
            if let image = info[.originalImage] as? UIImage {
                didPickImage?(image)
            }
            
            
        }
    }
    let sourceType: UIImagePickerController.SourceType
    init(sourceType: UIImagePickerController.SourceType, didPickImage: ((UIImage) -> Void)?) {
        self.sourceType = sourceType
        self.didPickImage = didPickImage
    }
    
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = UIImagePickerController()
        
        viewController.sourceType = sourceType
        
        viewController.delegate = context.coordinator
        context.coordinator.didPickImage = {image in
            didPickImage?(image)
            
        }
        
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView(sourceType: .photoLibrary, didPickImage: {
            image in
        })
        
    }
}
