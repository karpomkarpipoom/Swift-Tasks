//
//  EditModel.swift
//  MVVM-Sample
//
//  Created by BALAMURUGAN on 09/04/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import Foundation

class EditModel {
    
    var name        : String?
    var ageOfDate   : Int?
    var ageOfMonth  : Int?
    var ageOfYear   : Int?

    
    init(name : String, date : Int, Month : Int, Year : Int) {
        self.name = name
        self.ageOfDate = date
        self.ageOfMonth = Month
        self.ageOfYear = Year
    }
}
