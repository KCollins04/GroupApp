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
        infoTextOutlet.text = "Calories: \(itemInfo.0.calories) \n Serving Quantity: \(itemInfo.0.serving_qty!) \(itemInfo.0.serving_unit!)\nTotal Fat: \(itemInfo.1.nf_total_fat!)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let serving = Double(servingTextOutlet.text!)
        
        let cal = serving! * itemInfo.0.calories
        let ser = serving! * itemInfo.0.serving_qty!
        let totalf = serving! * itemInfo.1.nf_total_fat!
        infoTextOutlet.text = "Calories: \(cal)\nServing Quantity: \(ser) \(itemInfo.0.serving_unit!)\nTotal Fat: \(totalf)%"

        
    }
    
   

}
