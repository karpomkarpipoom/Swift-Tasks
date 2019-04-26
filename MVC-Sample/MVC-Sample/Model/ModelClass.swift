//
//  ModelClass.swift
//  MVC-Sample
//
//  Created by BALAMURUGAN on 29/03/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import Foundation

class PersonModel{
    
    private var _firstName  : String!
    private var _lastName   : String!
    
    var firstname : String {
        get{
            return _firstName
        }
        set (newvalue){
            _firstName = newvalue
        }
    }
    
    var lastname : String {
        return _lastName
    }
    
    init(firstname : String, lastname : String) {
        self._firstName = firstname
        self._lastName = lastname
    }
    
    var fullName : String {
        return "hello \(String(describing: _firstName)) \(String(describing: _lastName))"
    }
    
}
