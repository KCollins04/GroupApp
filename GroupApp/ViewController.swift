//
//  ViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/9/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var restorantInputOutlet: UITextField!
    @IBOutlet weak var mapOutlet: MKMapView!
    var locationManager = CLLocationManager()
    var current : CLLocation!
    
    var restorant : [MKMapItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // shows your location
    
        mapOutlet.showsUserLocation = true
        
        //Current location of the user
        let center = locationManager.location!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        mapOutlet.setRegion(region, animated: true)
        
    }

   
    
    
    @IBAction func rearchAction(_ sender: UIBarButtonItem) {
        let request = MKLocalSearch.Request()
        //User Input search
        request.naturalLanguageQuery = restorantInputOutlet.text
        let span = MKCoordinateSpan(
            latitudeDelta: 0.05, longitudeDelta: 0.05)
        request.region = MKCoordinateRegion(center: current.coordinate, span: span)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response
            else{return}
            for mapItem in response.mapItems{
                self.restorant.append(mapItem)
                let annoatation = MKPointAnnotation()
                annoatation.coordinate = mapItem.placemark.coordinate
                annoatation.title = mapItem.name
                self.mapOutlet.addAnnotation(annoatation)
                
            }
        }
    }
    
}

