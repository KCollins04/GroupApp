//
//  ViewController.swift
//  GroupApp
//
//  Created by KELSEY COLLINS on 2/9/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var restorantInputOutlet: UITextField!
    @IBOutlet weak var mapOutlet: MKMapView!
    var locationManager = CLLocationManager()
    var current : CLLocation!
    
    var restorant : [MKMapItem] = []
    var nearbyRestaurants: [restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // shows your location
    
        mapOutlet.showsUserLocation = false
        mapOutlet.delegate = self
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Current location of the user
        let center = locationManager.location!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        mapOutlet.setRegion(region, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMenu" {
            let controller = segue.destination as! PickerViewController
            Task{
                do{
                    controller.menu = try await getMenu("513fbc1283aa2dc80c000021")
                    controller.menuLoaded()
                } catch{
                    print(error)
                }
            }
        }
    }

  
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        let identifier = "Restuarant"

        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            //4
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true

            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            btn.tag = Int(annotation.subtitle!!)!
            btn.addTarget(self, action: #selector(restaurantClicked), for: .touchDown)

        } else {
            // 6
            annotationView?.annotation = annotation
        }

        return annotationView
    }
    
    @objc func restaurantClicked(_ button: UIButton) {
        print("button pressed", nearbyRestaurants[button.tag])
    }
    
    //search Restorant
    @IBAction func rearchAction(_ sender: UIBarButtonItem) {
        let allAnnotations = self.mapOutlet.annotations
        self.mapOutlet.removeAnnotations(allAnnotations)
        let coordinates = locationManager.location!.coordinate
        Task{
            do{
                let nearby = try await getRestaurant(coordinates.latitude, coordinates.longitude,1000,50)
                nearbyRestaurants = nearby
                for (index, item) in nearby.enumerated() {
                    print(item.name,item.lat,item.lng,item.id)
                    let location = CLLocation(latitude: item.lat,longitude: item.lng)
                    let newPin = MKPointAnnotation()
                        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

                        //set region on the map
                    
                    
                        mapOutlet.setRegion(region, animated: true)
                    // search item and it will pin that item
                    if restorantInputOutlet.text == item.name{
                        newPin.coordinate = location.coordinate
                        newPin.title = item.name
                        newPin.subtitle = String(index)
                        mapOutlet.addAnnotation(newPin)
                    }
                   
                    

                      
                }
            
               
                
            }
            catch{
                print(error)
            }
        }
    }
    
    
    
    
}

