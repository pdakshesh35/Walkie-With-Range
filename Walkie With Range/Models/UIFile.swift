//
//  UIFile.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/5/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import Foundation
import UIKit


public func customeButton(button : UIButton, title : String, radius : Int) {
    button.backgroundColor = .clear
    button.layer.cornerRadius = CGFloat(radius)
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.black.cgColor
    
    
}

