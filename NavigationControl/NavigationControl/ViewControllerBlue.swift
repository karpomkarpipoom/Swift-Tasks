//
//  ViewControllerBlue.swift
//  NavigationControl
//
//  Created by Bala on 13/02/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

class ViewControllerBlue: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        let userDef = UserDefaults.standard.value(forKey: "key")
        print(userDef as Any)

        // Do any additional setup after loading the view.
    }

    @IBAction func BTnAct(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
