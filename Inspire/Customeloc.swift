//
//  Customeloc.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 17/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseDatabase
import FirebaseAuth


class Customeloc: UIViewController ,CLLocationManagerDelegate ,MKMapViewDelegate {
    @IBOutlet weak var lati: UILabel!
    
    @IBOutlet weak var longi: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var showdatetimes: UILabel!
    @IBOutlet weak var trianernames: UITextField!
    var ref : DatabaseReference!
    var Long:Double = 0.0
    var Lat:Double = 0.0
    let locationManager = CLLocationManager()
    
   
    var trainernamess = String()
    var showdatetimess = String()
    
    
    var int : Int?
    @IBAction func submit(_ sender: UIButton) {
        
       lati.text = String(Lat)
        longi.text = String(Long)
    
        if (trianernames.text?.isEmpty)!{
            print("Please Enter the Name")
            myalert("Failed", "Please Enter the Name")
            
        }else { self.ref.child(trianernames.text!).child("CheckIn").setValue(["trainername" : trianernames.text,"showdatetime" : showdatetimes.text , "Longitude" : lati.text , "Latitude" : longi.text] )
            print("Check In successfully")
            
            myalert("Success", "Check In Successfully")
        }
            
        }
        
    
        //    print("Check In failed")
           // performSegue(withIdentifier: "custom1", sender:self)
            
          //  myalert("Failed", "Not in location")
    
    
    @IBAction func back(_ sender: UIButton) {
        
        let regView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as?ViewController
        self.navigationController?.pushViewController(regView!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        showdatetimes.text = showdatetimess
        trianernames.text = trainernamess
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self as CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            map.delegate = self
            
            locationManager.startUpdatingLocation()
        }
        
        lati.text = String(Lat)
        longi.text = String(Long)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        print(locValue.latitude)
        print(locValue.longitude)
        Long = locValue.latitude
        Lat = locValue.longitude
        
        
        
        //mapView1.setRegion(viewRegion, animated: false)
        
        // self.map.setRegion(UIRegion, animated: true)
        //return (locValue.latitude)
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        self.map.setRegion(region, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destination : Customeloc = segue.destination as! Customeloc
        
        showdatetimes.text = showdatetimess
        trianernames.text = trainernamess
        
    }
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
