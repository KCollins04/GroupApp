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
    var infoName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameOutlet.text = infoName
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
    }
    
   

}
