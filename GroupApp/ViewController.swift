//
//  ViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restorantInputOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*do{
            try print(getMenu("624af77b62f77a3958eb125b"))
        } catch let error{
            print(error)
        }*/
        getRestaurant(42.367173794047666,-88.26711087303146, 100)

    }

    @IBAction func getCurrentLocationAction(_ sender: Any) {
    }
    
    
    
}

