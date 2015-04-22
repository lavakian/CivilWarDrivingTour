//
//  SiteInfoViewController.swift
//  CivilWarDrivingTour
//
//  Created by Laura Avakian on 4/13/15.
//  Copyright (c) 2015 Laura Avakian. All rights reserved.
//

import Social
import UIKit

class SiteInfoViewController: UIViewController {
    
    @IBOutlet var siteTitle: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var funFacts: UITextView!
    @IBOutlet var siteDescription: UITextView!
    
    var siteName = ""
    var siteInfo = ["", "", "", "", ""]
    var siteAddress = ""
    
    var toSend = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.siteTitle.text = siteName
        
        self.address.text = siteInfo[2]
        
        self.funFacts.text = siteInfo[0]
        self.funFacts?.scrollRangeToVisible(NSMakeRange(0, 0))
        
        self.siteDescription.text = siteInfo[1]
        self.siteDescription?.scrollRangeToVisible(NSMakeRange(0, 0))
        
        siteAddress = siteInfo[4]
    }
    
    @IBAction func website(sender: UIButton) {
            performSegueWithIdentifier("Web", sender: self)
    }
    
    @IBAction func map(sender: UIButton) {
        performSegueWithIdentifier("MapView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "Web" {
            
            // Obtain the object reference of the destination view controller
            var webViewController: SitesWebViewController = segue.destinationViewController as! SitesWebViewController
            webViewController.websiteURL = siteAddress
            webViewController.siteName = siteName
            
        } else if segue.identifier == "MapView" {
            var mapViewController: SiteMapViewController = segue.destinationViewController as! SiteMapViewController
            mapViewController.siteName = siteName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
