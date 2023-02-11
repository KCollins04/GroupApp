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
        do{
            try print(getMenu("513fbc1283aa2dc80c000015"))
        } catch let error{
            print(error)
        }

    }

    @IBAction func getCurrentLocationAction(_ sender: Any) {
    }
    
    
    
}

