//
//  Defaults.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/5/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import Foundation
import UIKit

let defaults = UserDefaults.standard
let SIGNEDIN_KEY = "SIGNEDIN"

let MAIN_COLOR = UIColor(red:0.92, green:0.91, blue:0.93, alpha:1.0)

let SIGNEDIN_VALUE = defaults.bool(forKey: SIGNEDIN_KEY)


