//
//  ViewController.swift
//  basic-webservice
//
//  Created by Bala on 08/05/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getService()
        
        postService()
    }

    func postService() {
        
        let Url = String(format: "POSTURL")
        
        guard let serviceUrl = URL(string: Url) else {
            return
        }
        
        let param = ["email" : "balamurugan2999@gmail.com" , "password" : "hihukgauysgd" ]
        
        var request = URLRequest(url : serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else{
            return
        }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let response = response{
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
    
    
    func getService() {
        
        let url = URL(string: "https://api.github.com/users/erabala")
        
        URLSession.shared.dataTask(with: url!) { (data, Response, error) in
            
            if(error != nil){
                print("Error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]

                    print(json)
                    
                    print(json["login"] ?? "error")
                    
                }catch let error as NSError{
                    print(error)
                }
            }
        }.resume()
    }
 
}

