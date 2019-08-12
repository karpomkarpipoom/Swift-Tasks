//
//  ViewModel.swift
//  MVVM-WebAccess
//
//  Created by BALAMURUGAN on 11/08/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import Foundation
import Alamofire
import UnboxedAlamofire

typealias completionReturnType = (Any?, Error?) -> Void
typealias paramObjec = [String : AnyObject]

protocol emplyDetails {
    func postEmplyDetails(param : paramObjec ,completion : @escaping completionReturnType)
}

class emplyPostClass: emplyDetails {
    
    func postEmplyDetails(param: paramObjec, completion: @escaping completionReturnType) {
        
        let URL = "http://dummy.restapiexample.com/api/v1/create"
        
        Alamofire.request(URL, method: .post, parameters: param,encoding: URLEncoding.httpBody).responseObject { (response : DataResponse<postModel>) in
            
            let responseValue = response.result.value
            
            let error = response.result.error as? UnboxedAlamofireError
            
            completion(responseValue, error)
            
        }
        
        
    }
    
}
