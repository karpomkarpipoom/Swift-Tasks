//
//  ViewController.swift
//  NavigationControl
//
//  Created by Bala on 13/02/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Home"
        self.navigationController?.navigationBar.barTintColor = UIColor.green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func navigationConAct(_ sender: Any) {
    
        let story : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newviewcontroller = story.instantiateViewController(withIdentifier: "ViewControllerRed") as! ViewControllerRed

        newviewcontroller.SampleText = "some Value"
        self.navigationController?.pushViewController(newviewcontroller, animated: true)
        
        UserDefaults.standard.set("user Defaults something", forKey: "key")
        UserDefaults.standard.synchronize()
        
//        self.present(newviewcontroller, animated: true, completion: nil)
//        self.navigationController?.show(newviewcontroller, sender: nil)
    }
    
    
    @IBAction func SeguNav(_ sender: Any) {
        
        
    }
    
    @IBAction func seguNavigationWithoutConnect(_ sender: Any) {
        
        self.performSegue(withIdentifier: "NavBlue", sender: sender)
        
        
    }
    
}

