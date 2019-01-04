//
//  Register.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 14/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class Register: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var ref: DatabaseReference!
    
    let list = ["Sales" , "Training" ,"Medical", "Video Solution"]
    
    var prof: Int = 0
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var Emtext: UITextField!
    @IBOutlet weak var Ectext: UITextField!
    @IBOutlet weak var Deptext: UITextField!
    @IBOutlet weak var Mailtext: UITextField!
    
    
    @IBOutlet weak var passtext: UITextField!
    @IBOutlet weak var Mobtext: UITextField!
    
     var counterx: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  FirebaseApp.configure()
        ref = Database.database().reference()
        
        table.isHidden = true
        table.dataSource = self as? UITableViewDataSource
        table.delegate = self as? UITableViewDelegate
        // Do any additional setup after loading the view.
    }
    @IBAction func dropdown(_ sender: UIButton) {
        
        counterx = counterx+1
        if(counterx%2 == 0)
        {
            table.isHidden = true
        }
        else{
            table.isHidden = false
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return(list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        prof = indexPath.row
        if(prof == 0)
        {
            Deptext.text = "Sales"
            table.isHidden = true
        }
        if(prof == 1)
        {
            Deptext.text = "Training"
            table.isHidden = true
        }
        if(prof == 2)
        {
            Deptext.text = "Medical"
            table.isHidden = true
        }
        if(prof == 3)
        {
            Deptext.text = "Video Solution"
            table.isHidden = true
        }
               }
        
    
    
    
    
    
    
    
  
    @IBAction func Submit(_ sender: UIButton) {
        
        if  ((Emtext.text?.isEmpty)!||(Ectext.text?.isEmpty)!||(Deptext.text?.isEmpty)!||(Mailtext.text?.isEmpty)!||(passtext.text?.isEmpty)!||(Mobtext.text?.isEmpty)!)
        {
            
            print("Registration Failed")
            
            myalert("Failed", "Please fill all the fields.")
            
        }else{
        
        self.ref.child(Emtext.text!).child("Registration").setValue(["Employeee_Name" : Emtext.text,"Employee_code" : Ectext.text,"Depatment" : Deptext.text,"mail" : Mailtext.text,"mobile_No" : Mobtext.text, "password" : passtext.text] )
        
        Auth.auth().createUser(withEmail: Mailtext.text!, password: passtext.text!, completion:{
            (user,error) in
            
            if error  != nil  {
                print(error!)
                
                
            }else {
                
                print("Registration Successful")
                
                self.myalert("Success", "Registration Done Successfully")
                
                
                
            //    self.myalert("Success", "Register Successful")
                // let regs2 = self.storyboard?.instantiateViewController(withIdentifier : "reg") as?reg
                //self.navigationController?.pushViewController(regs2!, animated: true)
            }
            
            
        })
            
        let regView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(regView!, animated: true)
            
            
        }
        
 /*   let alert = UIAlertController(title: "Mobile Number", message: "Is this your Mobile Number? \n\(Mobtext.text!)", preferredStyle: .alert)
        
        let action = UIAlertAction (title: "Yes", style: .default){ (UIAlertAction) in
            
            
            PhoneAuthProvider.provider().verifyPhoneNumber(self.Mobtext.text!, uiDelegate: nil) {
                (VerificationID , error) in
                
                if error != nil {
                    
                    print("error\(String(describing: error?.localizedDescription))")
                } else{
                    
                    let defaults = UserDefaults.standard
                    defaults.set(VerificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "code", sender: Any?.self)
                }
            }     }
        
        
        let cancle = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancle)
        self.present(alert ,animated: true ,completion: nil)*/
        
    }
    
    
    
    
    @IBAction func back(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
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


