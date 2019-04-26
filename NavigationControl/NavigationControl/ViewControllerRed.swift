//
//  ViewControllerRed.swift
//  NavigationControl
//
//  Created by Bala on 13/02/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

class ViewControllerRed: UIViewController {

    var SampleText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(SampleText as Any)
        print("---------------------------------")
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    //    self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

}
