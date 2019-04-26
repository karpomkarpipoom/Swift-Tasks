//
//  ViewController.swift
//  CoreData-Swift
//
//  Created by Bala on 11/04/18.
//  Copyright © 2018 Erabala. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var ageText: UITextField!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var context : NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    @IBAction func Save(_ sender: Any) {
        
        guard let name = self.nameText.text, name != "" else{
            print("Empty")
            return
        }
        
        guard let age = self.ageText.text, age != "" else{
            print("Age is Empty")
            return
        }
        
        self.Save(name: name, age: age)
        
        print("true")
    }
    
    @IBAction func updatebtn(_ sender: Any) {
        guard let name = self.nameText.text, name != "" else{
            print("Empty")
            return
        }
        
        guard let age = self.ageText.text, age != "" else{
            print("Age is Empty")
            return
        }
        
        self.UpdatePerson(name: name, UpdateAge: age)
    }
    
    @IBAction func DeleteBtn(_ sender: Any) {
        guard let name = self.nameText.text, name != "" else{
            print("Empty")
            return
        }
       
        DeletePerson(name: name)
    }
    
    @IBOutlet weak var DeleteBtn: UIButton!
    func Save(name : String, age: String){
        
        let person = NSEntityDescription.insertNewObject(forEntityName : "Person", into: context!)
        
        person.setValue(name , forKey: "name")
        
        person.setValue(age , forKey: "age")
        
        do{
            try context?.save()
            
            print("Successsssss.....")
            
            self.Fetch()
            
        }catch{
            print("error ... ")
        }
    }
    
    func Fetch(){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context?.fetch(request)
            
            let count = results?.count
            
            if 0 < count! {
                
                for result in results! as! [NSManagedObject]{
                    
                    if let name = result.value(forKey : "name" ) as? String{
                        print("Name ====== \(name)")
                    }
                }
            }
            
        }catch{
            print("Error in fetch")
        }
    }
    
    func UpdatePerson(name : String, UpdateAge : String){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")

        let pred = NSPredicate(format : "name=%@", name)
        
        request.predicate = pred
        
        do{
            self.Fetch()
            
            let test = try context?.fetch(request)
            
            if test?.count == 1{
                 let objectUpdate = test![0] as! NSManagedObject
                
                objectUpdate.setValue(UpdateAge, forKey: "age")
                
                do{
                    try context?.save()
                    
                    print(" Update Successsssss.....")
                    
                    self.Fetch()
                    
                }catch{
                    print("error ... ")
                }
            }
            
        }catch{print("Error ....")}
        
    }
    
    func DeletePerson(name : String){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        let pred = NSPredicate(format : "name=%@", name)
        
        request.predicate = pred
        
        do{
            self.Fetch()
            
            let test = try context?.fetch(request)
            
            if test?.count == 1{
                let objectDelete = test![0] as! NSManagedObject
                
               context?.delete(objectDelete)
                
                do{
                    try context?.save()
                    
                    print(" Delete Successsssss.....")
                    
                    self.Fetch()
                    
                }catch{
                    print("error ... ")
                }
            }
            
        }catch{print("Error ....")}
        
    }
}

