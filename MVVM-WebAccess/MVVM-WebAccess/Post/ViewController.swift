//
//  ViewController.swift
//  MVVM-WebAccess
//
//  Created by BALAMURUGAN on 11/08/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var salary: UITextField!
    
    var paramDic = paramObjec()
    
    let viewModel = emplyPostClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SendAct(_ sender: Any) {
        
        guard let name = self.Name.text, name.count != 0 else {
            print("enter name ...")
            return
        }
        
        paramDic["name"] = name as AnyObject
        
        guard let age = self.Age.text, age.count != 0 else {
            print("enter age ...")
            return
        }
        
        paramDic["age"] = age as AnyObject

        
        guard let salary = self.salary.text, salary.count != 0 else {
            print("enter salary ...")
            return
        }
        
        paramDic["salary"] = salary as AnyObject

        self.viewModel.postEmplyDetails(param: paramDic) { (response, error) in
            let result = response as? postModel
            print(result)
        }
    }
    
}

