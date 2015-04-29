//
//  CommentsTableViewController.swift
//  CivilWarDrivingTour
//
//  Created by Ryan Kiel on 4/22/15.
//  Copyright (c) 2015 KoolKatz. All rights reserved.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    
    var timelineData:NSMutableArray! = NSMutableArray()
    
    @IBAction func loadData(){
        timelineData.removeAllObjects()
        var findTimelineData:PFQuery = PFQuery(className: "Comments")
        findTimelineData.findObjectsInBackgroundWithBlock{
            (objects:[AnyObject]?, error:NSError?)->Void in
            
            if error == nil{
                if let theObjects = objects{
                for object in theObjects{
                    let sweet:PFObject = object as! PFObject
                    self.timelineData.addObject(sweet)
                    }
                }
                let array:NSArray = self.timelineData.reverseObjectEnumerator().allObjects
                self.timelineData = NSMutableArray(array: array)
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(animated: Bool){
        self.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Visitor Comments"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return timelineData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:SweetTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SweetTableViewCell

        // Configure the cell...

        let sweet:PFObject = self.timelineData.objectAtIndex(indexPath.row) as! PFObject
        
        cell.sweetTextView.alpha = 0
        cell.timestampLabel.alpha = 0
        cell.usernameLabel.alpha = 0
    
        cell.sweetTextView.text = sweet.objectForKey("content") as! String
        var dataFormatter:NSDateFormatter = NSDateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        cell.timestampLabel.text = dataFormatter.stringFromDate(sweet.createdAt!)
        
        cell.usernameLabel.text = "Location"
        UIView.animateWithDuration(0.5, animations: {
            cell.sweetTextView.alpha = 1
            cell.timestampLabel.alpha = 1
            cell.usernameLabel.alpha = 1
        })
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
