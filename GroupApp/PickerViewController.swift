//
//  PickerViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/10/23.
//

import UIKit

class PickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var activeIndicatorOutlet: UIActivityIndicatorView!
    
    

    @IBOutlet weak var cellTableViewOutlet: UITableView!
    var menu: [foodItem] = []
    
    
    override func viewDidLoad() {
        cellTableViewOutlet.delegate = self
        cellTableViewOutlet.dataSource = self
        activeIndicatorOutlet.startAnimating()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? MenuViewCell else {print("error")
            
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ItemCell")
        }
        
        let foodItem = menu[indexPath.row]
        cell.nameItemOutlet?.text = foodItem.item_name
        cell.caloriesOutlet?.text = "Calories:\(foodItem.calories)"
        
        return cell
    }
  
    
    func menuLoaded(){
        cellTableViewOutlet.reloadData()
        activeIndicatorOutlet.stopAnimating()
    }
    
  

}
