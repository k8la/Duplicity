//
//  ListViewController.swift
//  Duplicity
//
//  Created by Kaitlyn on 3/18/15.
//  Copyright (c) 2015 K8La. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController{


    var searchController = UISearchController()
    var searchResults = []

    
    var firstType = [String]()
    var firstBrand = [String]()
    var firstName = [String]()
    var firstPrice = [String]()
    var firstImages = [UIImage]()
    var firstImageFiles = [PFFile]()
    
    var secondType = [String]()
    var secondBrand = [String]()
    var secondName = [String]()
    var secondPrice = [String]()
    var secondImages = [UIImage]()
    var secondImageFiles = [PFFile]()

    
//    func updateSearchResultsForSearchController(searchController: UISearchController)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.searchResults = []
//        self.searchController = UISearchController(searchResultsController: nil)
//        self.searchController.searchResultsUpdater = self
//        self.searchController.delegate = self
//        self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0)
//        self.tableView.tableHeaderView = self.searchController.searchBar
//        self.definesPresentationContext = true
//        
//        return searchController

        
//        let controller = UISearchController(searchResultsController: nil)
//        controller.searchResultsUpdater = self
//        controller.hidesNavigationBarDuringPresentation = true
//        controller.dimsBackgroundDuringPresentation = false
//        controller.searchBar.sizeToFit()

        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        var query = PFQuery(className:"Post")
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                //success
                println("Successfully retrieved \(objects.count) dupes.")
                
                for object in objects {
                    
                    self.firstType.append(object["firstType"] as String)
                    self.firstBrand.append(object["firstBrand"] as String)
                    self.firstName.append(object["firstName"] as String)
                    self.firstPrice.append(object["firstPrice"] as String)
//                    self.firstImages.append(object["firstImage"] as UIImage)
                    self.firstImageFiles.append(object["firstImageFile"] as PFFile)
                    
                    self.secondType.append(object["secondType"] as String)
                    self.secondBrand.append(object["secondBrand"] as String)
                    self.secondName.append(object["secondName"] as String)
                    self.secondPrice.append(object["secondPrice"] as String)
//                    self.secondImages.append(object["secondImage"] as UIImage)
                    self.secondImageFiles.append(object["secondImageFile"] as PFFile)
                    
                    self.tableView.reloadData()
                } // for ojbect in objects
                
            } else {
                println(error)
            } // if error == nil
        
        } //query.findObjects
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.firstType.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 227
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as CustomTableViewCell
        
//        myCell.title.text = titles[indexPath.row]
//        myCell.username.text = usernames[indexPath.row]
        
        cell.firstType.text = firstType[indexPath.row]
        cell.firstBrand.text = firstBrand[indexPath.row]
        cell.firstName.text = firstName[indexPath.row]
        cell.firstPrice.text = firstPrice[indexPath.row]
        cell.firstBrand.text = firstBrand[indexPath.row]
        
        
        cell.secondType.text = secondType[indexPath.row]
        cell.secondBrand.text = secondBrand[indexPath.row]
        cell.secondName.text = secondName[indexPath.row]
        cell.secondPrice.text = secondPrice[indexPath.row]
        cell.secondBrand.text = secondBrand[indexPath.row]
        
        
        firstImageFiles[indexPath.row].getDataInBackgroundWithBlock{
            (imageData: NSData!, error: NSError!) -> Void in
            
            if error == nil {
                println("found image")
                let image = UIImage(data: imageData)
                
                cell.firstImage.image = image
            }
            
        }
        
        secondImageFiles[indexPath.row].getDataInBackgroundWithBlock{
            (imageData: NSData!, error: NSError!) -> Void in
            
            if error == nil {
                println("found image")
                let image = UIImage(data: imageData)
                
                cell.secondImage.image = image
            }
            
        }


        
        return cell
        
    }
    
    


}

