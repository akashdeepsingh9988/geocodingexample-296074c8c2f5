//
//  ViewController.swift
//  GeocodingExample
//
//  Created by robin on 2018-07-25.
//  Copyright © 2018 robin. All rights reserved.
//

import UIKit
import CoreLocation // 1. need CoreLocation!


class ViewController: UIViewController {
 
    // i'm making a change here!!!!!!
    
    @IBOutlet weak var textboxLat: UITextField!
    @IBOutlet weak var textboxLong: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    
    //2. Create a variable for the geocoder
    lazy var geocoder = CLGeocoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func getLocationPressed(_ sender: Any) {
        let lat = Double(textboxLat.text!)!
        let lng = Double(textboxLong.text!)!
        
        print("looking up: \(lat), \(lng)")
        
        // 3. Create a location object
        let location = CLLocation(latitude: lat, longitude: lng)
        
        // 4. Do the geocoding - asynchronous request + a closure!
        geocoder.reverseGeocodeLocation(location) {
            (placemarks, error) in
            
            
            if (error != nil) {
               print("Cannot geocode this location: \(error)")
            }
            else {
                print("geocoding result: ")
                let placemark = placemarks?.first
                
                //DEBUGGING:  show the entire response from the geocoding request
                print(placemark?.addressDictionary)
                
                // UI Nonsense:  Show the city
                self.labelResult.text = "\(placemark?.locality)"
            }
            
        }
        
        
        labelResult.text=""
        
    }
    
    

}

