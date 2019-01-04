//
//  Contactus.swift
//  Inspire
//
//  Created by UMANG LOTIYA on 23/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit

class Contactus: UIViewController {
    
    @IBAction func back(_ sender: UIButton) {
        
        let  ourcourse = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(ourcourse!, animated: true)
    }
    @IBAction func addonmap(_ sender: UIButton) {
        
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "https://www.google.com/maps/place/Inspire+Infotech+Pvt.+Ltd./@28.549728,77.251388,15z/data=!4m5!3m4!1s0x0:0x110ce36bf1a91fe!8m2!3d28.549728!4d77.251388")!
        application.open(webURL)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
