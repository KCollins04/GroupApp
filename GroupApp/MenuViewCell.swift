//
//  MenuViewCell.swift
//  GroupApp
//
//  Created by SAMUEL LIM on 2/28/23.
//

import UIKit

class MenuViewCell: UITableViewCell {
  
    @IBOutlet weak var nameItemOutlet: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var caloriesOutlet: UILabel!
    
    @IBOutlet weak var servingsInput: UITextField!
    
    weak var parentTableView: UITableView?
    
    var addedToCart = false
    var food: foodItem!
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if(addedToCart){
            sender.setImage(UIImage(systemName: "plus.circle"), for: .normal)
            servingsInput.isHidden = true
            order[food.item_id] = nil
            //unsave()
            
            if((parentTableView) != nil){
                parentTableView?.reloadData()
            }
        } else{
            sender.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
            //servingsInput.isHidden = false
            order[food.item_id] = (food,1)
            //save()
        }
        
        addedToCart.toggle()
        
        print(order)
        
        
        
        
    }
}
