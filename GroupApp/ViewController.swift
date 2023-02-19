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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // shows your location
        
        mapOutlet.showsUserLocation = true
        
        
        
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
                } catch{
                    print(error)
                }
            }
        }
    }
    
    
    
    
    @IBAction func rearchAction(_ sender: UIBarButtonItem) {
        let coordinates = locationManager.location!.coordinate
        Task{
            do{
                let nearby = try await getRestaurant(coordinates.latitude, coordinates.longitude,1000,50)
                for item in nearby {
                    print(item.name,item.lat,item.lng,item.id)
                    let location = CLLocation(latitude: item.lat,longitude: item.lng)
                    let newPin = MKPointAnnotation()
                    let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                    
                    //set region on the map
                    mapOutlet.setRegion(region, animated: true)
                    
                    newPin.coordinate = location.coordinate
                    newPin.title = item.name
                    mapOutlet.addAnnotation(newPin)
                }
                
            } catch{
                print(error)
            }
        }
        
        
        // Getting the name of the place and adding info at the top of the pin  https://www.youtube.com/watch?v=VkvEA7v5JyQ&list=PLuoeXyslFTuas6GrfsUiFPShGXmaVDbgN&index=112
        
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView?{
            guard annotation is _____ else{return nil}
            
            let identifier = "___"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil{
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
            }
            else{
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        
        
        //UIAlert where it will take the user to another location when they accept https://stackoverflow.com/questions/54553460/performing-segue-after-uialert
        
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
            guard let _____ = view.annotation as? _____ else{return}
            
            let option = UIAlertAction(title: "Would you like to order from this place?", style: .default, handler: {(action) -> Void in
                let vc = self.storyboard.instan... //get the destination view controller
                    self.navigationController.push(vc, animated: true) //or you can present it using self.present(...) method

            })
        }
        
        
        
        
    }
    
}
