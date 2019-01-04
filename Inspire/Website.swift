//
//  Website.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 16/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit
import WebKit
class Website: UIViewController , UIWebViewDelegate {

    @IBAction func back(_ sender: UIButton) {
        
      let  web = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(web!, animated: true)
    }
    @IBAction func website(_ sender: UIButton) {
        
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/")!
        application.open(webURL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://training.inspireinfo.com/")!
        application.open(webURL)
        
        // Do any additional setup after loading the view.
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
