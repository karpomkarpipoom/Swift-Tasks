//
//  ViewController.swift
//  CollectionView
//
//  Created by Bala on 18/01/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit

class MyCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet weak var myLabel : UILabel?
    @IBOutlet weak var myImage : UIImageView?
    
}

class ViewController: UIViewController {

    let reuseID = "cell"
    var items = ["1","2","3","4","5","6","7","8","9","10"]

    override func viewDidLoad() {
        super.viewDidLoad()
  
        print("start")
    }

}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK:- DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        cell.myLabel?.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.gray
        cell.myImage?.image = #imageLiteral(resourceName: "image.png")
        
        return cell
    }
    
    // MARK:- Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item is selected \(indexPath.row)")
    }
    
    
}
