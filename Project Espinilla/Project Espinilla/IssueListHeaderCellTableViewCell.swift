//
//  IssueListHeaderCellTableViewCell.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/24/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class IssueListHeaderCellTableViewCell: UITableViewCell {
    @IBOutlet weak var issueListContentView: UIView!
    @IBOutlet weak var issueListHeaderLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
