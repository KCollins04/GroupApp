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

    
    @IBOutlet weak var servinfSize: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var servingPContainer: UILabel!
    @IBOutlet weak var cholesterolLabel: UILabel!
    @IBOutlet weak var tFat: UILabel!
    @IBOutlet weak var sFat: UILabel!
    @IBOutlet weak var dieFiberLabel: UILabel!
    @IBOutlet weak var totalCarbohydrateLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    
    var itemInfo: (foodItem,itemInfo)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameOutlet.text = itemInfo.0.item_name
        servinfSize.text = "\(itemInfo.0.serving_qty!)"
        caloriesLabel.text = "\(itemInfo.1.nf_calories!)"
        tFat.text = "\(itemInfo.1.nf_total_fat!)"
        sFat.text = "\(itemInfo.1.nf_saturated_fat!)"
        tFat.text = "\(itemInfo.1.nf_trans_fatty_acid!)"
        cholesterolLabel.text = "\(itemInfo.1.nf_cholesterol!)"
        sodiumLabel.text = "\(itemInfo.1.nf_sodium!)"


    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let serving = Double(servingTextOutlet.text!)
        
        let cal = serving! * itemInfo.0.calories
        let ser = serving! * itemInfo.0.serving_qty!
        let totalf = serving! * itemInfo.1.nf_total_fat!
      /*  infoTextOutlet.text = "Calories: \(cal)\nServing Quantity: \(ser) \(itemInfo.0.serving_unit!)\nTotal Fat: \(totalf)%"
*/
        
    }
    
   

}
