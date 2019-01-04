//
//  MenuStyle3Footer.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle3FooterDelegate {
    func logout()
    func setting()
}

class MenuStyle3Footer: UIView {

    var delegate: MenuStyle3FooterDelegate?
    @IBOutlet var btnLogout: UIButton!
    @IBOutlet var btnSetting: UIButton!
    
    @IBAction func pushLogout(_ sender: Any) {
        delegate?.logout()
    }
    
    @IBAction func pushSetting(_ sender: Any) {
        delegate?.setting()
    }
    
}
