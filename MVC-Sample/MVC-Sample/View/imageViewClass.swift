//
//  imageViewClass.swift
//  MVC-Sample
//
//  Created by BALAMURUGAN on 29/03/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class imageViewClass: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
