//
//  IssueViewCell.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/27/17.
//  Copyright © 2017 Carter. All rights reserved.
//

import UIKit

class IssueViewCell: UITableViewCell {

    @IBOutlet weak var issueContent: UIView!
    @IBOutlet weak var issueText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
