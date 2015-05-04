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
    
    @IBOutlet var siteImage: UIImageView!
    @IBOutlet var siteTitle: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var funFacts: UITextView!
    @IBOutlet var siteDescription: UITextView!
    
    var siteName = ""
    var siteInfo = ["", "", "", "", "", "", ""]
    var siteAddress = ""
    var imageName = ""
    
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
        
        println(siteInfo[5])
        
        siteImage.image = UIImage(named: siteInfo[5])
    }
    
    @IBAction func website(sender: UIButton) {
            performSegueWithIdentifier("Web", sender: self)
    }
    
    @IBAction func directions(sender: UIButton) {
        performSegueWithIdentifier("Directions", sender: self)
    }
    
    @IBAction func sources(sender: UIButton) {
        performSegueWithIdentifier("Sources", sender: self)
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
        } else if segue.identifier == "Directions" {
            var directionsViewController: DirectionsViewController = segue.destinationViewController as! DirectionsViewController
            directionsViewController.siteInfo = siteInfo
            directionsViewController.siteAddress = siteAddress
            directionsViewController.siteName = siteName
        } else if segue.identifier == "Sources" {
            var sourcesViewController: SourcesViewController = segue.destinationViewController as! SourcesViewController
            sourcesViewController.siteInfo = siteInfo
            sourcesViewController.siteAddress = siteAddress
            sourcesViewController.siteName = siteName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
