//
//  CustomSearchVC.swift
//  SearchBar
//
//  Created by BALAMURUGAN on 18/07/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class CustomSearchVC: UIViewController {

    @IBOutlet weak var SearchTextField: UITextField!
    
    
    let ArrayList = ["one", "Two", "Three", "Four", "Five", "Six","seven", "Eight", "Nine", "Ten"]
    
    var filterList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.SearchTextField.addTarget(self, action: #selector(SearchControl), for: .editingChanged )
        
    }
    
    @objc func SearchControl(){
        
        let searchText = self.SearchTextField.text
        
        print(searchText as Any)
        self.filterList.removeAll()
        
        if searchText == "" || searchText == " "  {
            print("empty Search")
            self.filterList = ArrayList
            return
        }
        
        for item in ArrayList {
            
            let text = searchText!.lowercased()
            let isArrayContain = item.lowercased().range(of: text)
            
            if isArrayContain != nil {
                print("Success")
                filterList.append(item)
            }
        }
        
        print(filterList)
    }
}
