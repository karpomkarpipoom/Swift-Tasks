//
//  CameraAndGallaryAccess.swift
//  AccessMethods
//
//  Created by BALAMURUGAN on 03/03/20.
//  Copyright © 2020 BALAMURUGAN. All rights reserved.
//

import UIKit

class CameraAndGallaryAccess: UIViewController {
    
    @IBOutlet weak var ProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectProfileImageBtn(_ sender: Any) {
        
        let Alert = UIAlertController(title: "Choose", message: "Select the Media type.", preferredStyle: .actionSheet)
        let Gallery = UIAlertAction(title: "use Gallary", style: .default) { UIAlertAction in
            
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true)

        }
        let camera = UIAlertAction(title: "use Camera", style: .default) { UIAlertAction in
            
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = .camera
            image.allowsEditing = true
            self.present(image, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        Alert.addAction(Gallery)
        Alert.addAction(camera)
        Alert.addAction(cancel)
        
        self.present(Alert, animated: true, completion: nil)
        
    }
}

extension CameraAndGallaryAccess : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
        if let editedImage = info[.editedImage] as? UIImage {

            self.ProfileImage.image = editedImage
            picker.dismiss(animated: true)
            
        }else if let originalImage = info[.originalImage] as? UIImage{

            self.ProfileImage.image = originalImage
            picker.dismiss(animated: true)
        }else {
            print("ERROR")
        }
                
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User cancel the Process")
    }
    
}
