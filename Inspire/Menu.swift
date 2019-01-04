//
//  Menu.swift
//  menuslider
//
//  Created by UMANG LOTIYA on 29/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class Menu: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var prof: Int = 0

    @IBOutlet weak var table: UITableView!
    let Menu = ["Student Registration" , "Trainer Check In" ,"Trainer Check Out","Custome Location", "Our Course","Website" , "Contact Us" ,"Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.tableFooterView = UIView()

        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return Menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = table.dequeueReusableCell(withIdentifier: "TableViewCell") as!TableViewCell
        
        cell.laveltitle.text = Menu[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        prof = indexPath.row
        if(prof == 0)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Studentreg") as? Studentreg
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 1)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Checkin") as? Checkin
            self.navigationController?.pushViewController(regView!, animated: true)
        }
       if(prof == 2)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Checkout") as? Checkout
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        if(prof == 3)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Customeloc") as? Customeloc
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        
        if(prof == 4)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Ourcourse") as? Ourcourse
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        
        if(prof == 5)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Website") as? Website
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        
        if(prof == 6)
        {
            let regView = self.storyboard?.instantiateViewController(withIdentifier: "Contactus") as? Contactus
            self.navigationController?.pushViewController(regView!, animated: true)
        }
        
        if(prof == 7)
        {
            do{
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
                
                
            }
            catch{
                print("Error in Logging Out")
                
                
            }
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

}
