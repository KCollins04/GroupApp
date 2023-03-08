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
    var itemInfo: foodItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameOutlet.text = itemInfo.item_name
        infoTextOutlet.text = "Calories: \(itemInfo.calories) \n Serving Quabtity: \(itemInfo.serving_qty!) \(itemInfo.serving_unit!)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
        
    }
    
   

}
