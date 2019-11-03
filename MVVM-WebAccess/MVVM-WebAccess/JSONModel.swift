//
//  JSONModel.swift
//  MVVM-WebAccess
//
//  Created by BALAMURUGAN on 21/08/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import Foundation
import Unbox

struct JSONModel {
    let status : Bool
    let statuscode : Int
    let data : [CountryInnerModel]
}

extension JSONModel : Unboxable {
    
    init(unboxer: Unboxer) throws {
        self.status   = try unboxer.unbox(key: "status")
        self.statuscode = try unboxer.unbox(key: "statusCode")
        self.data    = try unboxer.unbox(key: "data")
    }
    
}

struct CountryInnerModel {
    
    let CountName : String
    let CountIso : String
    let CountCode : Int
    let states    : [statesModel]?
}

extension CountryInnerModel : Unboxable {
    
    init(unboxer: Unboxer) throws {
        self.CountName   = try unboxer.unbox(key: "countryName")
        self.CountIso   = try unboxer.unbox(key: "countryIso")
        self.CountCode   = try unboxer.unbox(key: "countryCode")
        self.states      = try! unboxer.unbox(key: "states")

    }
    
}


struct statesModel {
    let name : String?
    let iso  : String?
}

extension statesModel : Unboxable {
    
    init(unboxer: Unboxer) throws {
        self.name   = try unboxer.unbox(key: "name")
        self.iso   = try unboxer.unbox(key: "iso")
        
    }
    
}
