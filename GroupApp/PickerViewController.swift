//
//  PickerViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/10/23.
//

import UIKit

class PickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var cellTableViewOutlet: UITableView!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameOutlet: UITextField!
    
    
    override func viewDidLoad() {
        cellTableViewOutlet.delegate = self
        cellTableViewOutlet.dataSource = self


    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
  
    
    @IBAction func randomAction(_ sender: UIBarButtonItem) {
    }
    
}
