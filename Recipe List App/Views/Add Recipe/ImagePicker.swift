//
//  ImagePicker.swift
//  Recipe List App
//
//  Created by Rekha Aldas on 11/09/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    
    var selectedSource: UIImagePickerController.SourceType
    
    @Binding var recipeImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        // Create the image picker controller
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = selectedSource
        
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        // Create a coordinator
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // Check if we can get the image
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                
                // We were able to get the uiimage into the image constant, pass this back to the AddRecipeView
                parent.recipeImage = image
            }
            
            // Dismiss this view
            parent.presentationMode.wrappedValue.dismiss()   
        }
    }
}
