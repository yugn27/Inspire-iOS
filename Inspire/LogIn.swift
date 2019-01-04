//
//  LogIn.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 15/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import Firebase


class LogIn: UIViewController {
  // var ref: DatabaseReference!
    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // FirebaseApp.configure()
    //    ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: uName.text!, password: passWord.text!) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
                print("Successful")
                self.clear()
                let regView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
                self.navigationController?.pushViewController(regView!, animated: true)
                
                self.myalert("Success", "login successful")
                
            } else {
                print("Error logging in: \(error!.localizedDescription)")
                    self.myalert("Failed", "Incorrect Email ID or Password")
            }
        }
        
        clear()
    }
    
    
    func clear()
    {
        uName.text = ""
        passWord.text = ""
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


