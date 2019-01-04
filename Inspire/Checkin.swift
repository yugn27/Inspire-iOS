//
//  Checkin.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 16/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class Checkin: UIViewController ,CLLocationManagerDelegate ,MKMapViewDelegate {

    @IBOutlet weak var lati: UILabel!
    @IBOutlet weak var longi: UILabel!
    
    
    var ref : DatabaseReference!
    var Long:Double = 0.0
    var Lat:Double = 0.0
    let locationManager = CLLocationManager()
    
    

    @IBOutlet weak var dttime: UILabel!
    @IBOutlet weak var trainername: UITextField!
    @IBOutlet weak var showdatetime: UILabel!
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lati.text = String(Lat)
        longi.text = String(Long)
        ref = Database.database().reference()
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        // let dateString = formatter.string(from: pow)
        //print(dateString)
        
        
        let result = formatter.string(from: date)
        
        showdatetime.text = result
        
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self as CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            map.delegate = self
            
            locationManager.startUpdatingLocation()
        }
        
        
        // Update location lang and lattude
        lati.text = String(Lat)
        longi.text = String(Long)
                // Do any additional setup after loading the view.
        
    }
    @IBAction func back(_ sender: UIButton) {
        let regView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(regView!, animated: true)
    }
    
    @IBAction func submit(_ sender: UIButton) {
        lati.text = String(Lat)
        longi.text = String(Long)
      
        
        if (trainername.text?.isEmpty)!{
            print("Please Enter the Name")
            myalert("Failed", "Please Enter the Name")
            
        }else  if( (28.549401 < Long &&  28.549999 > Long) && (77.251001 < Lat &&  77.251999 > Lat) )
            
            
            
        {
            
            
            self.ref.child(trainername.text!).child("Check In").setValue(["trainername" : trainername.text,"showdatetime" : showdatetime.text , "Longitude" : lati.text , "Latitude" : longi.text] )
            
            print("Check In successfully")
            
            myalert("Success", "Check In Successfully")
      
            
        }
        else
        {
          print("Check In failed")
            performSegue(withIdentifier: "custom1", sender:self)
            
           myalert("Failed", "Not in location")
          
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     
    */

    
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
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destination : Customeloc = segue.destination as! Customeloc
        
        destination.trainernamess = trainername.text!
        destination.showdatetimess = showdatetime.text!
    
    }
    
}
