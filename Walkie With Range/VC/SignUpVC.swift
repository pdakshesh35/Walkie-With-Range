//
//  SignUpVC.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/5/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SCLAlertView

class SignUpVC: UIViewController {
    
    @IBOutlet weak var backBtn_view : UIButton!
    @IBOutlet weak var name_field : UITextField!
    @IBOutlet weak var email_field : UITextField!
    @IBOutlet weak var pass_field : UITextField!

    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customeButton(button: backBtn_view, title: "back", radius: 5)
        
        
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn_action(_sender : Any) {
        print(name_field.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBn_action(_sender: Any) {
        
        //if any field is empty
        if(name_field.text?.isEmpty == true || email_field.text?.isEmpty == true || pass_field.text?.isEmpty == true ) {
            
            print("Something is Missing from Sign up module")
        } else if (isValidPassword() == false) {
            
            print("password is not compitable")
        } else {
            
            Auth.auth().createUser(withEmail: email_field.text!, password: pass_field.text!, completion: { (user, error) in
                if (error == nil) {
                    print("successfully signed up")
                    
                    Auth.auth().signIn(withEmail: self.email_field.text!, password: self.pass_field.text!, completion: { (user, error) in
                        if error == nil {
                           
                            //Successfully signed up
                            self.performSegue(withIdentifier: Segues.SignUpToUsername, sender: nil)
                           
                            
                        } else {
                                SCLAlertView().showCustom("Error", subTitle: error?.localizedDescription as! String, color: MAIN_COLOR, icon: #imageLiteral(resourceName: "radio"))
                                
                        }
                    })
                } else {
                    SCLAlertView().showCustom("Error", subTitle: error?.localizedDescription as! String, color: MAIN_COLOR, icon: #imageLiteral(resourceName: "radio"))
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.SignUpToUsername {
            if let destinationVC = segue.destination as? UsernameVC {
                destinationVC.name = self.name_field.text!
            }
        }
    }
    public func isValidPassword() -> Bool {
        let passwordRegex = "(?=.*[a-z]).{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self.pass_field.text)
    }
    
   
    
}
