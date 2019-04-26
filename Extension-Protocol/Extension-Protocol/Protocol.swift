//
//  Protocol.swift
//  Extension-Protocol
//
//  Created by Bala on 23/01/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

protocol CallService {
    
    func getValues(Successmessage : String)
    func errorValues(errormessage : String)
    
}

class main : NSObject {
    
    var callService : CallService?
    
    func login(urlString : String) {
        print(urlString)
    }
}
