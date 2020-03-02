//
//  ViewController.swift
//  MVVM-Sample
//
//  Created by BALAMURUGAN on 09/04/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField    : UITextField!
    @IBOutlet weak var dateField    : UITextField!
    @IBOutlet weak var monthField   : UITextField!
    @IBOutlet weak var yearField    : UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func AlertAction(_ sender: Any) {
        
        guard let name = nameField.text, name != "" else {
            print("Enter the name")
            return
        }
        
        guard let date = dateField.text, date != "" else {
            print("Enter the date")
            return
        }
        
        guard let month = monthField.text, name != "" else {
            print("Enter the month")
            return
        }
        
        guard let year = yearField.text, name != "" else {
            print("Enter the year")
            return
        }
        
        let person = editViewModel(name: name, date: Int(date)!, Month: Int(month)!, Year: Int(year)!)
        
        print(person.name)
        print(person.age)
        
    }
    
}

