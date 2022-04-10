//
//  ViewController.swift
//  GroceryList
//
//  Created by ADITI SAINI on 2022-04-08.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

