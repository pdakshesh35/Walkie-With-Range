//
//  User.swift
//  Walkie With Range
//
//  Created by Dakshesh patel on 3/1/18.
//  Copyright © 2018 Dakshesh patel. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class User {
    
    
    let emailId : String
    let name : String
    let uid : String
    let username : String
    
    init(emailId : String, uid : String, name : String, username : String) {
        self.emailId = emailId
        self.uid = uid
        self.name = name
        self.username = username
    }
    
    init(snapshot : DataSnapshot) {
        let snapshotValue = snapshot.value as! [String : Any]
        self.emailId = snapshotValue[EMAIL_FIREBASE] as! String
        self.name = snapshotValue[NAME_FIREBASE] as! String
        self.uid = snapshotValue[UID_FIREBASE] as! String
        self.username = snapshotValue[USERNAME_FIREBASE] as! String
        
    }
    
    
    func getemailId() -> String {
        return self.emailId
    }
    
    func getusername() -> String {
        return self.username
    }
    
    func getuid() -> String {
        return self.uid
    }
    
    func getname() -> String {
        return self.name
    }
    
    
    func setUserDataToFirebase(ref : DatabaseReference!) {
        ref.database.reference().child(USERS_FIREBASE).child(self.username).setValue([USERNAME_FIREBASE : self.username,
                                                                        EMAIL_FIREBASE : self.emailId,
                                                                        
                                                                        NAME_FIREBASE : self.name,
                                                                        UID_FIREBASE : self.uid
        ]) { (err, ref) in
            if err == nil {
                print("successfully uploaded the username data")
            } else {
                print(err.debugDescription)
            }
        }
    }
    
    
}
