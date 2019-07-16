//
//  ViewController.swift
//  SearchBar
//
//  Created by BALAMURUGAN on 16/07/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar        : UISearchBar!
    @IBOutlet weak var TabelViewList    : UITableView!
    
    let ArrayList = ["one", "Two", "Three", "Four", "Five", "Six"]
    
    var filterList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.searchBar.delegate = self
        
        self.filterList = ArrayList
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filterList[indexPath.row]
        return cell
    }
    
    
}


extension ViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
        self.filterList.removeAll()
        
        if searchText == "" || searchText == " "  {
            print("empty Search")
            self.filterList = ArrayList
            self.TabelViewList.reloadData()
            return
        }
        
        for item in ArrayList {
            
            let text = searchText.lowercased()
            let isArrayContain = item.lowercased().range(of: text)
            
            if isArrayContain != nil {
                print("Success")
                filterList.append(item)
            }
        }
        
        self.TabelViewList.reloadData()
        print(filterList)
    }
    
}

