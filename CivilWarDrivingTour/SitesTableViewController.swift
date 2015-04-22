//
//  SiteInfoViewController.swift
//  CivilWarDrivingTour
//
//  Created by Laura Avakian on 4/13/15.
//  Copyright (c) 2015 Laura Avakian. All rights reserved.
//

import UIKit

class SitesTableViewController: UITableViewController {
    // Obtain the object reference to the UITableView object
    //@IBOutlet var countryCityTableView: UITableView!
    @IBOutlet var sitesTableView: UITableView!
    
    var dict_sites: NSMutableDictionary = NSMutableDictionary.alloc()
    
    //---------- Create and Initialize the Arrays -----------------------
    
    var siteNames = [String]()
    var diningHallNames = [String]()
    
    var array3: AnyObject?
    
    
    // dataObjectToPass is the data object to pass to the downstream view controller
    var siteName = ""
    var siteInfo = ["", "", "", "", ""] // 5 pieces of data?
    
    /*
    -----------------------
    MARK: - View Life Cycle
    -----------------------
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("got here")
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        println("ran parse code")
        
        // Override point for customization after application launch.
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectoryPath = paths[0] as! String
        let plistFilePathInDocumentDirectory = documentDirectoryPath + "/Sites.plist"
        var dictionaryFromFile: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInDocumentDirectory)
        if var dictionaryFromFileInDocumentDirectory = dictionaryFromFile{
            dict_sites = dictionaryFromFileInDocumentDirectory
            siteNames = dictionaryFromFileInDocumentDirectory.allKeys as! [String]
        }
        else {
            var plistFilePathInMainBundle = NSBundle.mainBundle().pathForResource("Sites", ofType: "plist")
            var dictionaryFromFileInMainBundle: NSMutableDictionary? = NSMutableDictionary(contentsOfFile: plistFilePathInMainBundle!)
            dict_sites = dictionaryFromFileInMainBundle!
        }
        
        
        //println(siteNames)
        siteNames = dict_sites.allKeys as! [String]
        //println(siteNames)
    }
    
    /**********************************************
    MARK: - Table View Data Source Protocol Methods
    **********************************************/
    
    // We are implementing a Grouped table view style as we selected in the storyboard file.
    
    /*
    ---------------------------------------
    Return Number of Sections in Table View
    ---------------------------------------
    */
    
    // Each table view section corresponds to a country
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    /*
    --------------------------------
    Return Number of Rows in Section
    --------------------------------
    */
    
    // Number of rows in a given country (section) = Number of Cities in the given country (section)
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siteNames.count
    }
    
    
    /*
    ------------------------------------
    Prepare and Return a Table View Cell
    ------------------------------------
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SiteTableViewCell {
        
        
        var rowNumber: Int = indexPath.row    // Identify the row number
        
        // Obtain the object reference of a reusable table view cell object instantiated under the identifier
        // TableViewCellReuseID, which was specified in the storyboard
        var cell: SiteTableViewCell = tableView.dequeueReusableCellWithIdentifier("SiteCell") as! SiteTableViewCell
        
        // Obtain the name of the row from the table view list
        var rowName: String = siteNames[rowNumber]
        cell.siteName!.text = rowName

        return cell
    }
    
    /*******************************************
    MARK: - Table View Delegate Protocol Methods
    *******************************************/
    
    /*
    -------------------------
    Selection of a City (Row)
    -------------------------
    */
    
    // Tapping a row (city) displays a map of the city
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Obtain the name of the genre of the selected movie
        var selectedSite = siteNames[indexPath.section]
        println(selectedSite)
        
        array3 = dict_sites[selectedSite]
        
        println(array3)
        
        // Obtain the list of cities in the country as Objective-C array
        //var movies: AnyObject? = applicationDelegate.dict_Genre_titles[selectedGenreName]
        //var sites = dict_sites[selectedSite] as NSMutableDictionary
        //siteNames = sites.allKeys as [String]
        // Convert the Objective-C array to Swift array
        //var nameOfSelectedRow: String = siteNames[indexPath.row]
        
        //array3 = sites[nameOfSelectedRow]
        var info = array3 as! [String]
        
        
        siteName = selectedSite
        siteInfo = info
        
        
        performSegueWithIdentifier("SiteInfo", sender: self)
    }
    
    
    /*
    ------------------------------
    Detail Accessory Button Tapped
    ------------------------------
    */
    
    // This is the method invoked when the user taps the Detail accessory button (circle icon with i)
    /*override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
        // Obtain the name of the genre of the selected movie
        var selectedDiningHall = siteNames[indexPath.section]
        
        // Obtain the list of cities in the country as Objective-C array
        //var movies: AnyObject? = applicationDelegate.dict_Genre_titles[selectedGenreName]
        var dininghalls = dict_sites[selectedDiningHall] as NSMutableDictionary
        diningHallNames = dininghalls.allKeys as [String]
        // Convert the Objective-C array to Swift array
        var nameOfSelectedRow: String = diningHallNames[indexPath.row]
        
        array3 = dininghalls[nameOfSelectedRow]
        var info = array3 as [String]
        
        diningHall = selectedDiningHall
        siteName = info[0]
        siteInfo = info
        
        performSegueWithIdentifier("SiteInfo", sender: self)
    }*/
    
    
    /************************
    MARK: - Prepare for Segue
    ************************/
    
    // This method is called by the system whenever you invoke the method performSegueWithIdentifier:sender:
    // You never call this method. It is invoked by the system.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "SiteInfo" {
            
            /*println("meow")
            println(siteInfo)
            println(siteName)*/
            
            // Obtain the object reference of the destination view controller
            var siteInfoViewController: SiteInfoViewController = segue.destinationViewController as! SiteInfoViewController
            
            //Pass the data object to the destination view controller object
            //siteInfoViewController.siteInfo = siteInfo
            siteInfoViewController.siteName = siteName
            siteInfoViewController.siteInfo = siteInfo
            
        }
    }
    
}