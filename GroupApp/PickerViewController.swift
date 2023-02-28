//
//  PickerViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/10/23.
//

import UIKit

class PickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var cellTableViewOutlet: UITableView!
    
    var menu: [foodItem] = []
    override func viewDidLoad() {
        cellTableViewOutlet.delegate = self
        cellTableViewOutlet.dataSource = self


    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! MenuViewCell
        
        let foodItem = menu[indexPath.row]
        cell.nameItemOutlet?.text = foodItem.item_name
        return cell
    }
  
    
    @IBAction func randomAction(_ sender: UIBarButtonItem) {
    }
    
    func menuLoaded(){
        cellTableViewOutlet.reloadData()
    }
    
}
