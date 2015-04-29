//
//  SweetTableViewCell.swift
//  CivilWarDrivingTour
//
//  Created by Ryan Kiel on 4/22/15.
//  Copyright (c) 2015 KoolKatz. All rights reserved.
//

import UIKit

class SweetTableViewCell: UITableViewCell {

    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var timestampLabel: UILabel!
    @IBOutlet var sweetTextView: UITextView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
