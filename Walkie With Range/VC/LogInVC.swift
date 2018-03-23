//
//  ViewController.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/1/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LogInVC: UIViewController {
    
    @IBOutlet weak var emai_field: UITextField!
    @IBOutlet weak var pass_field: UITextField!
     var ref : DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logIn_btn(_ sender: Any) {
        SIGNIN_FIREBASE(email: emai_field.text!, pass: pass_field.text!)
        if Auth.auth().currentUser == nil {
            
            print("nil")
            
        } else {
           
           
            print(Auth.auth().currentUser?.uid as! String)
        }
        
        
    }
    
    @IBAction func signUp_btn(_ sender: Any) {
        try! Auth.auth().signOut()
      
    }
    
    
}

