//
//  EditViewModel.swift
//  MVVM-Sample
//
//  Created by BALAMURUGAN on 09/04/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import Foundation

class editViewModel {
    
    private var person : EditModel
    
    init(name : String, date : Int, Month : Int, Year : Int) {
        self.person = EditModel.init(name: name, date: date, Month: Month, Year: Year)
    }
    
    var name : String {
        let capName = person.name?.capitalized
        return capName!
    }
    
    var age  : Double {
        
        let DOB = Calendar.current.date(from: DateComponents(year: person.ageOfYear, month: person.ageOfMonth, day: person.ageOfDate))!
        
        let myAge = Calendar.current.dateComponents([.month], from: DOB ,to: Date()).month!
        
        let year = myAge / 12
        let month = myAge % 12
        
        let currentAge = Double("\(year).\(month)")
        
        return currentAge!
    }
    
}
