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
                        
                        mapOutlet.addAnnotation(newPin)
                }
                
            } catch{
                print(error)
            }
        }
    }
    
}

