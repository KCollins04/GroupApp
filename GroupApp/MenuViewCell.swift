//
//  MenuViewCell.swift
//  GroupApp
//
//  Created by SAMUEL LIM on 2/28/23.
//

import UIKit

class MenuViewCell: UITableViewCell {
  
    @IBOutlet weak var nameItemOutlet: UILabel!
    
    @IBOutlet weak var caloriesOutlet: UILabel!
    
    var addedToCart = false
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if(addedToCart){
            sender.setImage(UIImage(systemName: "star"), for: .normal)
            //unsave()
        } else{
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
            //save()
        }
        addedToCart.toggle()
        
        print(addedToCart)
        
        
        
        
    }
}
