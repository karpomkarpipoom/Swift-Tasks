//
//  ViewController.swift
//  MVC-Sample
//
//  Created by BALAMURUGAN on 28/03/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let person = PersonModel.init(firstname: "karpom", lastname: "karpipoom")
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var secondNameLabel: UITextField!
    
    @IBOutlet weak var HelloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HelloLabel.text = person.fullName
        
    }

    @IBAction func sayHelloBtn(_ sender: Any) {
        
        if let text = firstNameLabel.text {
            person.firstname = text
            HelloLabel.text = person.fullName
        }
    }
    
}

