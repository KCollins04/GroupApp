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
    var sortedFood = sortedMenu(appetizer: [], entre: [], dessert: [], drink: [])
    
    
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
    
    @IBAction func optionChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("appetizer")
            menu = sortedFood.appetizer!
            break
        case 1:
            print("entre")
            menu = sortedFood.entre!
            break
        case 2:
            print("dessert")
            menu = sortedFood.dessert!
            break
        case 3:
            print("drink")
            menu = sortedFood.drink!
        default:
            print("ERROR")
        }
        cellTableViewOutlet.reloadData()
        activeIndicatorOutlet.stopAnimating()
    }
    
    func menuLoaded(){
        Task{
            do{
                // Sorts the menu, then replaces it with the default (appetizer) menu
                try await sortedFood = sortMenu(menu)
                menu = sortedFood.appetizer!
                cellTableViewOutlet.reloadData()
                activeIndicatorOutlet.stopAnimating()
            } catch{
                print(error)
            }
        }
    }
    
    var food: foodItem!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        food = menu[indexPath.row]
        performSegue(withIdentifier: "myCell", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myCell" {
            let controller = segue.destination as! InfoViewController
            controller.itemInfo = food
            // Waits to get the menu of the selected restaurant, then tells the PickerViewController that the menu has loaded
            
            }
        }
    }
    

