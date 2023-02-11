//
//  PickerViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/10/23.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewOutlet.delegate = self

    }
    
    //number of the col
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //number row
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }

    

}
