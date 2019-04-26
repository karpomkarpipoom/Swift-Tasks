//
//  ViewController.swift
//  AlertController
//
//  Created by BALAMURUGAN on 23/04/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func BasicsAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "LogOut ?", message: "You Can Logout From here ...", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            print("Cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: { _ in
            print("Logout Action")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func withDistruction(_ sender: Any) {
        
        let alert = UIAlertController(title: "LogOut ?", message: "You Can Logout From here ...", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            print("Cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.destructive, handler: { _ in
            print("Logout Action")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func ActionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "LogOut ?", message: "You Can Logout From here ...", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            print("Cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.destructive, handler: { _ in
            print("Logout Action")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func WithTextField(_ sender: Any) {
        
        let alert = UIAlertController(title: "Enter your name ", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let conform = UIAlertAction.init(title: "confirm", style: .default) { _ in
            if let textF = alert.textFields?.first, let textValue = textF.text {
                print("text ==> " + textValue)
            }
        }
        
        let cancel = UIAlertAction.init(title: "cancel", style: .cancel) { _ in
            print("cancel")
        }
        
        alert.addTextField(configurationHandler: { (TextField) in
            TextField.placeholder = "hello ta"
        })
        
        alert.addAction(conform)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func moreBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "LogOut ?", message: "You Can Logout From here ...", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            print("Cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertAction.Style.destructive, handler: { _ in
            print("Logout Action")
        }))
       
        alert.addAction(UIAlertAction(title: "default", style: UIAlertAction.Style.destructive, handler: { _ in
            print("def Action")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

