//
//  ViewController.swift
//  shoppingCartHuseby
//
//  Created by CATHERINE HUSEBY on 10/31/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var addanItemOutlet: UITextField!
    let alreadyAddedAlert = UIAlertController(title: "Alert", message: "you already added this item", preferredStyle: UIAlertController.Style.alert)
    // create a cancel action
    
    // add the cancel action to the alertController
    
    
    // create an OK action
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        // handle response here.
    }
    
    var defaults = UserDefaults.standard
    var shoppingCart: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if (myview.cellForRow(at: indexPath))!.accessoryType == .none {
            myview.cellForRow(at: indexPath)!.accessoryType = .checkmark
        } else {
            myview.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
      //  shoppingCart[indexPath.row] = "\(myview.cellForRow(at: indexPath)?.textLabel?.text ?? "") (recieved)"
      //  defaults.setValue(shoppingCart, forKey: "shoppingCart")
        
     //   myview.cellForRow(at: indexPath)?.textLabel?.text = shoppingCart[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myview.dequeueReusableCell(withIdentifier: "yip")
        cell!.textLabel!.text = shoppingCart[indexPath.row]

        return cell!
        
        
    }
    
    
    
    @IBOutlet weak var myview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        alreadyAddedAlert.addAction(OKAction)
        shoppingCart.append("food")
        
        myview.dataSource = self
        myview.delegate = self
        
        
        shoppingCart = defaults.stringArray(forKey: "shoppingCart") ?? ["food"]
        myview.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            shoppingCart.remove(at: indexPath.row)
            myview.deleteRows(at: [indexPath], with: .fade)
            
            defaults.setValue(shoppingCart, forKey: "shoppingCart")
            
            
        }
        }
    
    
    
    @IBAction func sort(_ sender: Any) {
        
        shoppingCart.sort(by: <)
        defaults.setValue(shoppingCart, forKey: "shoppingCart")
        
      //  print(shoppingCart)
        myview.reloadData()
    }
    
    

    
    
    @IBAction func addItem(_ sender: Any) {
        
    
        let new = addanItemOutlet.text
        var a = true
        if let x = new {
            
            for y in shoppingCart {
                if x == y {
                    present(alreadyAddedAlert, animated: true)
                   a = false
                }
                
            }
            
            if a {
                shoppingCart.append(x)
            }
            
            
        }
        
        
        
        defaults.setValue(shoppingCart, forKey: "shoppingCart")
        myview.reloadData()
        
        
    }
    
    
    
    
    
}

