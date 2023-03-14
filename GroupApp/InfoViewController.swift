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
    
    @IBOutlet weak var ironLabel: UILabel!
    @IBOutlet weak var calciumLabel: UILabel!
    @IBOutlet weak var vitaminCLabel: UILabel!
    @IBOutlet weak var vitaminALabel: UILabel!
    
    var itemInfo: (foodItem,itemInfo)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameOutlet.text = itemInfo.0.item_name
        servinfSize.text = "\(itemInfo.0.serving_qty!)"
        caloriesLabel.text = "\(itemInfo.1.nf_calories!)"
        totalFat.text = "\(itemInfo.1.nf_total_fat!)g"
        sFat.text = "\(itemInfo.1.nf_saturated_fat!)g"
        tFat.text = "\(itemInfo.1.nf_trans_fatty_acid!)g"
        cholesterolLabel.text = "\(itemInfo.1.nf_cholesterol!)mg"
        sodiumLabel.text = "\(itemInfo.1.nf_sodium!)g"
        totalCarbohydrateLabel.text = "\(itemInfo.1.nf_total_carbohydrate!)g"
        dieFiberLabel.text = "\(itemInfo.1.nf_dietary_fiber!)g"
        sugarLabel.text = "\(itemInfo.1.nf_sugars!)g"
        proteinLabel.text = "\(itemInfo.1.nf_protein!)g"
        vitaminALabel.text = "\(itemInfo.1.nf_vitamin_a_dv!)mcg"
        vitaminCLabel.text = "\(itemInfo.1.nf_vitamin_c_dv!)mcg"
        ironLabel.text = "\(itemInfo.1.nf_iron_dv!)mg"
        calciumLabel.text = "\(itemInfo.1.nf_calcium_dv!)mg"


    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let serving = Double(servingTextOutlet.text!)
        
        itemNameOutlet.text = itemInfo.0.item_name
        servinfSize.text = "\(serving! * itemInfo.0.serving_qty!)"
        caloriesLabel.text = "\(serving! * itemInfo.1.nf_calories!)"
        totalFat.text = "\(serving! * itemInfo.1.nf_total_fat!)g"
        sFat.text = "\(serving! * itemInfo.1.nf_saturated_fat!)g"
        tFat.text = "\(serving! * itemInfo.1.nf_trans_fatty_acid!)g"
        cholesterolLabel.text = "\(serving! * itemInfo.1.nf_cholesterol!)mg"
        sodiumLabel.text = "\(serving! * itemInfo.1.nf_sodium!)g"
        totalCarbohydrateLabel.text = "\(serving! * itemInfo.1.nf_total_carbohydrate!)g"
        dieFiberLabel.text = "\(serving! * itemInfo.1.nf_dietary_fiber!)g"
        sugarLabel.text = "\(serving! * itemInfo.1.nf_sugars!)g"
        proteinLabel.text = "\(serving! * itemInfo.1.nf_protein!)g"
        vitaminALabel.text = "\(serving! * itemInfo.1.nf_vitamin_a_dv!)mcg"
        vitaminCLabel.text = "\(serving! * itemInfo.1.nf_vitamin_c_dv!)mcg"
        ironLabel.text = "\(serving! * itemInfo.1.nf_iron_dv!)mg"
        calciumLabel.text = "\(serving! * itemInfo.1.nf_calcium_dv!)mg"
   
        
    }
    
   

}
