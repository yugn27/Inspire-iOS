//
//  ViewController.swift
//  menuslider
//
//  Created by UMANG LOTIYA on 29/09/1940 Saka.
//  Copyright © 1940 UMANG LOTIYA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menu_vc : Menu!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! Menu
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swiperight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeleft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swiperight)
        self.view.addGestureRecognizer(swipeleft)
        
       // table.tableFooterView = UIView()


        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func  respondToGesture(gesture : UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right Swipe")
            show_menu()
            
        case UISwipeGestureRecognizerDirection.left:
            print("Left Swipe")
            
            //closed_menu()
            close_on_swipe()
        default:
            break
        }
        
    }
    
    func close_on_swipe() {
        
        if AppDelegate.menu_bool{
            
          //  show_menu()
        } else {
            
            closed_menu()
        }
    }
    @IBAction func menu(_ sender: UIBarButtonItem) {
        
        if AppDelegate.menu_bool{
            
            show_menu()
            
        }else{
            
            closed_menu()
        }
    }
    func show_menu() {
        
        UIView.animate(withDuration: 0.3) { () -> Void in

        self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.height)
      self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChildViewController(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
        AppDelegate.menu_bool = false
        }    }

    func closed_menu(){
        
        UIView.animate(withDuration: 0.3 ,animations: { () -> Void in
            
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        })
        { (finished) in
             self.menu_vc.view.removeFromSuperview()
        //    self.removeFromParentViewController()
        }
            
        AppDelegate.menu_bool = true
        
    }
}

