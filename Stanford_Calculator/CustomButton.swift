//
//  button.swift
//  Stanford_Calculator
//
//  Created by Michael Hardin on 4/23/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var cornerRadius:CGFloat = 5.0
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.cornerRadius
    }
   
    
    
    
}