//
//  Model.swift
//  MVVM-WebAccess
//
//  Created by BALAMURUGAN on 11/08/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import Foundation
import Unbox

struct postModel {
    let name : String
    let salary : String
    let age : String
    let id : String
}

extension postModel : Unboxable {
    init(unboxer: Unboxer) throws {
        self.name   = try! unboxer.unbox(key: "name")
        self.salary = try! unboxer.unbox(key: "salary")
        self.age    = try! unboxer.unbox(key: "age")
        self.id     = try! unboxer.unbox(key: "id")
    }
    
}
