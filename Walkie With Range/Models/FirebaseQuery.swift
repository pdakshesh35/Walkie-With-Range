//
//  FirebaseQuery.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/5/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import UIKit
import SCLAlertView

var ref : DatabaseReference!

func SIGNIN_FIREBASE(email : String, pass : String)  {
    
    let defaults = UserDefaults.standard
    defaults.set(nil, forKey: SIGNEDIN_KEY)
    Auth.auth().signIn(withEmail: email, password: pass)  { (user, err) in
        if (err == nil) {
            print("Signed IN")
            defaults.setValue(true, forKey: SIGNEDIN_KEY)
           
        } else {
            print("Error_Signed In")
           defaults.setValue(false, forKey: SIGNEDIN_KEY)
        }
    }
    
    
}

func checkUserNameAlreadyExist(newUsername : String, name : String) {
    
    var ref : DatabaseReference!
    ref = Database.database().reference()
    ref.child(USERS_FIREBASE).queryOrderedByKey().queryEqual(toValue: newUsername).observeSingleEvent(of: .value, with: { (snapshot) in
        
        if snapshot.exists() {
            
                SCLAlertView().showCustom("Error", subTitle: "Username is already in use", color: MAIN_COLOR, icon: #imageLiteral(resourceName: "radio"))
        } else {
            //username does not exist
            let users = User(emailId: (Auth.auth().currentUser?.email)!, uid: Auth.auth().currentUser?.uid as! String, name: name, username: newUsername)
            users.setUserDataToFirebase(ref: ref)
        }
    })
    
}





