//
//  ViewController.swift
//  Final Assesment (Reuben)
//
//  Created by Nicole on 25/08/2016.
//  Copyright © 2016 NextAcademy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onLoginButtonPressed(sender: AnyObject) {
        guard let email = emailTextField.text , let password = passwordTextField.text else {
            return
        }
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
            if let user=user {
                User.signIn(user.uid)
                self.performSegueWithIdentifier("HomeSegue", sender: nil)
            }else {
                let controller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .Alert)
                let dissmissButton = UIAlertAction(title: "try Again", style: .Default, handler: nil)
                controller.addAction(dissmissButton)
                self.presentViewController(controller, animated: true, completion: nil)
            }
        })

        
        
    }
    
    

}

