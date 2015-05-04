//
//  DirectionsViewController.swift
//  CivilWarDrivingTour
//
//  Created by Laura Avakian on 5/4/15.
//  Copyright (c) 2015 KoolKatz. All rights reserved.
//

import UIKit

class DirectionsViewController: UIViewController {

    var siteName = ""
    var siteAddress = ""
    var siteInfo = ["", "", "", "", "", "", ""]
    
    @IBOutlet var siteTitle: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var directions: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.siteTitle.text = siteName
        
        self.address.text = siteInfo[2]

        self.directions.text = siteInfo[3]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
