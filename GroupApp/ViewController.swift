//
//  ViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/9/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{

    @IBOutlet weak var restorantInputOutlet: UITextField!
    @IBOutlet weak var mapOutlet: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapOutlet.delegate = self
        
        // Do any additional setup after loading the view.
  
        Task {
          do{
                try await print(getMenu("513fbc1283aa2dc80c000021"))
            } catch{
                print("Unknown error")
            }
    
        }
        
    }

   
    
    
    
}

