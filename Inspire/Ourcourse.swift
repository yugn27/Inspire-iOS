//
//  Ourcourse.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 16/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit

class Ourcourse: UIViewController , UIWebViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        let  ourcourse = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(ourcourse!, animated: true)
    }
    @IBAction func iosapp(_ sender: UIButton) {
        
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/iosappdevelopment.html")!
        application.open(webURL)
    }
    
    @IBAction func Macstudio(_ sender: UIButton) {
        
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/macstudio.html")!
        application.open(webURL)
    }
    
    
    @IBAction func Macsupportspecialist(_ sender: UIButton) {
        
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/macsupport.html")!
        application.open(webURL)
    }
    
    @IBAction func Macofficeexecutive(_ sender: UIButton) {
   
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/macoffice.html")!
        application.open(webURL)
    }
    
    
    @IBAction func Macsmemanager(_ sender: UIButton) {
        
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/macsme.html")!
        application.open(webURL)
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
