//
//  ViewController.swift
//  UITabelViewSection
//
//  Created by Bala on 21/01/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

protocol ButtonAction {
    func buttonselection(indexpath : IndexPath)
}

class tabelViewCell : UITableViewCell{

    var indexpath : IndexPath? = nil
    var delegate : ButtonAction? = nil
    
    @IBOutlet weak var textLabel2: UILabel?
    @IBOutlet weak var btnOutlet: UIButton?
    
    @IBAction func BtnAction(_ sender: UIButton) {
        
            if (sender.isSelected)
            {
                sender.isSelected = false
            }
            else
            {
                sender.isSelected = true
            }
       
            self.delegate?.buttonselection(indexpath: indexpath!)
        
    }
    
}

class ViewController: UIViewController {

    let sections: [String] = ["Edit Profile", "Users Social", "Map Settings"]
    let Edit : [String] = ["Edit Profile Picture", "Users' Name", "Users' email","Users' Date of birth", "Users' Location", "Users' university"]
    let Social : [String] = ["Facebook", "Twitter"]
    let Map : [String] = ["Change Distance"]
    
    var sectionData: [Int: [String]] = [:]

    let cellIdentifier = "cell"
    let PrograssCellIdentifier = "PrograssCell"
    
    @IBOutlet weak var Tabel: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tabel.delegate = self
        Tabel.dataSource = self
        
        sectionData = [0 : Edit, 1 : Social, 2 : Map]
        
    }

}

extension ViewController : ButtonAction {
    
    func buttonselection(indexpath: IndexPath) {
        print(indexpath.row)
        print(indexpath.section)
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return (sectionData[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
        -> String? {
            return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            // Custom Cell
            
            
            
            if indexPath.section == 2 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: PrograssCellIdentifier) as! tabelViewCell?

                cell!.textLabel2?.text = sectionData[indexPath.section]![indexPath.row]

                return cell!
                
            }
            
            if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! tabelViewCell?
                
                cell?.btnOutlet?.setImage( #imageLiteral(resourceName: "SwichOff"), for: UIControlState.normal)
                cell?.btnOutlet?.setImage( #imageLiteral(resourceName: "SwichOn"), for: UIControlState.selected)
                cell?.btnOutlet?.isSelected = false //default swich off image display
                
                cell!.textLabel2?.text = sectionData[indexPath.section]![indexPath.row]
                
                return cell!
                
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! tabelViewCell?
                
                cell?.btnOutlet?.setImage(#imageLiteral(resourceName: "AddButton"), for: UIControlState.normal)

                cell?.indexpath = indexPath as IndexPath
                cell?.delegate = self
                
                if indexPath.row == 0{
                    cell?.btnOutlet?.setImage(#imageLiteral(resourceName: "UserProfile"), for: UIControlState.normal)
                }
                
                cell!.textLabel2?.text = sectionData[indexPath.section]![indexPath.row]

                return cell!
            }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
        view.tintColor = UIColor.green
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "BabasNeue", size: 20)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            print("Show Alert")
        }
    
    }
}
