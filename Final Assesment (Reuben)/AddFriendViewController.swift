//
//  AddFriendViewController.swift
//  Final Assesment (Reuben)
//
//  Created by Nicole on 25/08/2016.
//  Copyright © 2016 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class AddFriendViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var listsOfUser = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredFriendsList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var firebaseRef = FIRDatabase.database().reference()
        
        
        
        firebaseRef.child("users").observeEventType(.ChildAdded, withBlock: {(snapshot) in
            if let listsOfUserName = snapshot.value as? [String: AnyObject]{
                if let userName = listsOfUserName["email"] as? String {
                    self.listsOfUser.append(userName)
                    self.tableView.reloadData()
                    
                }
            }
            
        })
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filteredContentForSearchText(searchText: String, scope: String = "All") {
//        filteredFriendsList = listsOfUser.filter()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsOfUser.count
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as! AddUserTableViewCell
        let userName = listsOfUser[indexPath.row]
        cell.userName.text = userName
        
        return cell
    }
    
  
}
extension AddFriendViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
       
    }
}
