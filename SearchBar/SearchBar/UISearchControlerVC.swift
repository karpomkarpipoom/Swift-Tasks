//
//  UISearchControlerVC.swift
//  SearchBar
//
//  Created by BALAMURUGAN on 18/07/19.
//  Copyright © 2019 BALAMURUGAN. All rights reserved.
//

import UIKit

class UISearchControlerVC: UIViewController {

    @IBOutlet weak var TabelViewList    : UITableView!
    var search = UISearchController()
    
    let ArrayList = ["one", "Two", "Three", "Four", "Five", "Six","seven", "Eight", "Nine", "Ten"]
    
    var filterList = [String]()
    
    let CellID = "CellController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        search = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            return controller
        })()
        
        self.title = "UISearchController"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.searchController = search
        
        self.filterList = ArrayList

    }

}


extension UISearchControlerVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as UITableViewCell
        cell.textLabel?.text = filterList[indexPath.row]
        return cell
    }
    
}

extension UISearchControlerVC : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        print(searchController.searchBar.text ?? "")
        let searchText = searchController.searchBar.text ?? ""
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
