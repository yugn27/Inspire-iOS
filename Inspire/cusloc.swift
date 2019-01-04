//
//  cusloc.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 25/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseDatabase
import FirebaseAuth


class cusloc: UIViewController ,CLLocationManagerDelegate ,MKMapViewDelegate {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        lati.text = String(Lat)
        longi.text = String(Long)
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var lati: UILabel!
    
    @IBOutlet weak var longi: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var showdatetimes: UILabel!
    @IBOutlet weak var trianernames: UITextField!
    
    var ref : DatabaseReference!
    var Long:Double = 0.0
    var Lat:Double = 0.0
    let locationManager = CLLocationManager()
    
    
    var trainernamesss = String()
    var showdatetimesss = String()
    
    
    var int : Int?
    @IBAction func submit(_ sender: UIButton) {
        
        lati.text = String(Lat)
        longi.text = String(Long)
        
        if (trianernames.text?.isEmpty)!{
            
            print("Please Enter the Name")
            
              myalert("Failed", "Please Enter the Name")
            
            }else{ self.ref.child(trianernames.text!).child("Checkout").setValue(["trainername" : trianernames.text,"showdatetime" : showdatetimes.text , "Longitude" : lati.text , "Latitude" : longi.text] )
        print("Check out successfully")
        
        myalert("Success", "Check out Successfully")
        
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
        
        showdatetimes.text = showdatetimesss
        trianernames.text = trainernamesss
        
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
        
        var destination : cusloc = segue.destination as! cusloc
        
        showdatetimes.text = showdatetimesss
        trianernames.text = trainernamesss
        
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
