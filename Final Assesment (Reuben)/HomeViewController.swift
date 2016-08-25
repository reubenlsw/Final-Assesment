//
//  HomeViewController.swift
//  Final Assesment (Reuben)
//
//  Created by Nicole on 25/08/2016.
//  Copyright © 2016 NextAcademy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var fireBaseRef = FIRDatabase.database().reference()
    var listOfFeed = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var userInputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let feedRef = fireBaseRef.child("feeds")
        feedRef.observeEventType(.ChildAdded, withBlock: {(snapshot) in
            if let feedDictionary = snapshot.value as? [String : AnyObject] {
                if let feedText = feedDictionary["text"] as? String{
                    self.listOfFeed.append(feedText)
                    self.tableView.reloadData()
                }
            }
            
        })
    }
    @IBAction func onPostStatusButtonPressed(sender: UIButton) {
        guard let userInput = userInputTextField.text else {
            return
        }
        let feedDict = ["text": userInput, "UserUID":User.currentUserUid()!]
        fireBaseRef.child("feeds").childByAutoId().setValue(feedDict)
        userInputTextField.text = ""
        userInputTextField.resignFirstResponder()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfFeed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell")
        
        
        
        fireBaseRef.child("users").observeEventType(.ChildAdded, withBlock: {(snapshot) in
            if let listsOfUsers = snapshot.value as? [String: AnyObject]{
                print(listsOfUsers)
                print(snapshot.value)
                if let userName = listsOfUsers["username"] as? String {
                    let feedText = self.listOfFeed[indexPath.row]
                    
                    cell?.textLabel?.text = userName
                    cell?.detailTextLabel?.text = feedText
                    
                }
                
            }
            
        })
        
        return cell!
    }
    
}









