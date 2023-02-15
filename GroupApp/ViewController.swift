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
        Task {
          do{
                try await print(getMenu("513fbc1283aa2dc80c000021"))
            } catch{
                print("Unknown error")
            }
    
        }
        

    }

    @IBAction func getCurrentLocationAction(_ sender: Any) {
    }
    
    
    
}

