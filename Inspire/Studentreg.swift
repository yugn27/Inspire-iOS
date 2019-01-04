//
//  Studentreg.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 16/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

var ref : DatabaseReference!

class Studentreg: UIViewController {
    @IBAction func back(_ sender: UIButton) {
        let regView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
     self.navigationController?.pushViewController(regView!, animated: true)
        
    
    }
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var college: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var progenroll: UITextField!
    
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
        if  ((name.text?.isEmpty)!||(email.text?.isEmpty)!||(mobile.text?.isEmpty)!||(college.text?.isEmpty)!||(course.text?.isEmpty)!||(progenroll.text?.isEmpty)!)
            {
           
                print("Registration Failed")
                
                myalert("Failed!", "Please filled all the fields.")
           
           
        }else{
        
        self.ref.child(name.text!).child("Student Registration").setValue(["Student Name" : name.text,"E mail" : email.text,"Mobile" : mobile.text,"College" : college.text,"Course" : course.text, "Progenroll" : progenroll.text] )
        
        print("Registration done sucessfully")
            
            self.myalert("Success", "Registration done successfully")
        }
        
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
