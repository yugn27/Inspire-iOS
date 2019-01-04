//
//  roundbutton.swift
//  uibutton
//
//  Created by Vaibhav Jaiswal on 08/12/18.
//  Copyright © 2018 Vaibhav Jaiswal. All rights reserved.
//

import UIKit
@IBDesignable
class roundbutton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
