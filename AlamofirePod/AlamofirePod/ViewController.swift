//
//  ViewController.swift
//  AlamofirePod
//
//  Created by Bala on 16/08/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    self.AlamoGet()
        
//        self.AlamoPost(username: "karpom", device: "ios", appVersion: "1.0")
    }

    func AlamoGet(){
        
        let url = "http://178.128.15.223:7070/api/account/get_seed"
        
        Alamofire.request(url).responseJSON { (response : DataResponse<Any>) in
            switch(response.result){
            case .success(_):
                if let JSONData = response.result.value{
                    let values = JSONData as! [String : AnyObject]
                    
                    let valueOfData = values["data"]
                    let arrayValue = valueOfData!.components(separatedBy: " ") as [String]
                    
                    print(arrayValue)
                }
                break
            case .failure(_):
                print(response.result.error ?? "")
                break
            }
        }
    }
    
    func AlamoPost(username : String, device : String, appVersion: String){
        
        let url = mainURL
        
        let dictparam : [String : AnyObject] = ["username" : username as AnyObject,
                                                "device" : device as AnyObject,
                                                "appversion" : appVersion as AnyObject]
        
        Alamofire.request(url, method: .post, parameters: dictparam, encoding: JSONEncoding.default, headers: nil).responseJSON { (response : DataResponse<Any>) in
            
            switch(response.result){
            case .success(_):
                if let JSONData = response.result.value{
                    let values = JSONData as! [String : String]
                    
                    print(values["status"])
                }
                break
            case .failure(_):
                print(response.result.error ?? "")
                break
            }
            
        }
        
    }
}

