//
//  InfoViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/10/23.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var itemNameOutlet: UILabel!
    @IBOutlet weak var servingTextOutlet: UITextField!
    @IBOutlet weak var infoTextOutlet: UITextView!
    var itemInfo: (foodItem,itemInfo)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameOutlet.text = itemInfo.0.item_name
        infoTextOutlet.text = "Calories: \(itemInfo.0.calories) \n Serving Quabtity: \(itemInfo.0.serving_qty!) \(itemInfo.0.serving_unit!)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
        
    }
    
   

}
