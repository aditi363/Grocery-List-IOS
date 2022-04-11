//
//  ViewController.swift
//  GroceryList
//
//  Created by ADITI SAINI on 2022-04-08.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textDes: UITextField!
    @IBOutlet weak var textStore: UITextField!
    @IBOutlet weak var textItemName: UITextField!
    @IBOutlet weak var textQuantity: UITextField!
    @IBOutlet weak var textPrice: UITextField!
    
    var dbHelper = SQLiteHelper()
    
    @IBAction func addBtn(_ sender: UIButton) {
        
        let listModel =  ListModel()
        
        listModel.itemname = textItemName.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Item Name"
   
        listModel.listname = textName.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Shop Name"
        
        listModel.cost =  Double(textPrice.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "0") ?? 0
        
        listModel.quantity = Int(textQuantity.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "0") ?? 0
        
        dbHelper.insertData(list: listModel)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        
        _ = navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dbHelper.connect()
        dbHelper.createTable()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItem") as! GroceryItemTableViewCell
        //let image = Im
        cell.cartImage.image = UIImage(named: "Trolley")
        cell.groceyItemName.text = "Item " + String(indexPath.row)
        return cell
    }


}

