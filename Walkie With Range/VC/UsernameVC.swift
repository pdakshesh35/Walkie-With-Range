//
//  UsernameVC.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/6/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import UIKit
import SCLAlertView
import FirebaseAuth
import FirebaseDatabase

class UsernameVC: UIViewController {
    
    @IBOutlet weak var username_field : UITextField!
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createUsername(_ sender: Any) {
        if (isValidUsernameFormat(username: self.username_field.text)) {
            checkUserNameAlreadyExist(newUsername: self.username_field.text!, name: self.name)
        } else {
            SCLAlertView().showCustom("Not valid format", subTitle: "Username should only contain lowercase letter and numbers", color: MAIN_COLOR, icon: #imageLiteral(resourceName: "radio"))
        }
    }
    
    
    // validate an email for the right format
    func isValidUsernameFormat(username:String?) -> Bool {
        
        guard username != nil else { return false }
        
        let regEx = "[0-9a-z+-]+"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: username)
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
