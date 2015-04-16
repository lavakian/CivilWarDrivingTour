//
//  SiteTableViewCell.swift
//  CivilWarDrivingTour
//
//  Created by Laura Avakian on 4/13/15.
//  Copyright (c) 2015 Laura Avakian. All rights reserved.
//

import UIKit

class SiteTableViewCell: UITableViewCell {
    
    // Object references to the table view cell UI objects
    //@IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var siteName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}