//
//  ViewController.swift
//  Navigation-Search
//
//  Created by BALAMURUGAN on 16/07/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SearchBarOutlet: UISearchBar!
    
    let ArrayList = ["one", "Two", "Three", "four", "Five"]
    
    var filterArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.SearchBarOutlet.delegate = self 
    }

}


// MARK:- UISearch Controller
extension ViewController :  UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
        self.filterArray.removeAll()
        
        guard searchText != " " || searchText != "" else {
            print("Empty Search Bar")
            return
        }
        
        for item in ArrayList {
            let Text = searchText.lowercased()
            let isArrayContain = item.lowercased().range(of: Text)
            
            if isArrayContain != nil{
                print("true")
                filterArray.append(item)
            }
        }
        
        print(filterArray)
    }
    
}
