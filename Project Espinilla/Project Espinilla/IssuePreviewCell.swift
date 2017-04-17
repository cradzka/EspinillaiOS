//  IssuePreviewCell.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/1/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class IssuePreviewCell: UITableViewCell {
    
    @IBOutlet weak var IssueTextView: UITextView!
    @IBOutlet weak var issueContentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
