//
//  User.swift
//  Final Assesment (Reuben)
//
//  Created by Nicole on 25/08/2016.
//  Copyright © 2016 NextAcademy. All rights reserved.
//

import UIKit


class User: NSObject {
    
    
    class  func signIn(uid: String){
        NSUserDefaults.standardUserDefaults().setValue(uid, forKeyPath: "uid")
    }
    
    class func isSignedIn() -> Bool {
        if let _ = NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String {
            return true
        } else{
            return false
        }
    }
    
    class  func currentUserUid() -> String? {
        return NSUserDefaults.standardUserDefaults().valueForKey("uid") as? String
    }
}