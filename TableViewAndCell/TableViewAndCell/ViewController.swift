//
//  ViewController.swift
//  TableViewAndCell
//
//  Created by Bala on 12/11/17.
//  Copyright © 2017 Erabala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableData = ["gend","text","3","count","5"]
    let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tableData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
      /*
        Non - Custom cell
        
        let normalCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UITableViewCell
        normalCell.textLabel?.text = "sample"
        return normalCell
       */
        
        
        // Custom Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TableViewCell
        
        // Configure the cell...
        cell.CellTextLabel.text = tableData[indexPath.row]
        cell.CellTwo.text = tableData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell did Select Row At IndexPath \(tableData[indexPath.row])")
    }
}
