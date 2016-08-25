//
//  SignUpViewController.swift
//  
//
//  Created by Nicole on 25/08/2016.
//
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
  
    var fireBaseRef = FIRDatabase.database().reference()


    @IBAction func onSignUpButtonPressed(sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, let userName=usernameTextField.text else{
            return
        }
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
            if let user = user {
                let userDict = ["email":email, "username":userName]

                self.fireBaseRef.child("users").child(user.uid).setValue(userDict)
                
                
                User.signIn(user.uid)
                
               
                self.performSegueWithIdentifier("HomeSegue", sender: nil)
                
                
            } else{
            
                print(error?.localizedDescription)
                let controller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .Alert)
                let dissmissButton = UIAlertAction(title: "try Again", style: .Default, handler: nil)
                controller.addAction(dissmissButton)
                self.presentViewController(controller, animated: true, completion: nil)
            }
        })

    }


}
