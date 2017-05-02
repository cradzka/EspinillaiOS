//
//  BuildingViewTile.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/27/17.
//  Copyright © 2017 Carter Radzka. All rights reserved.
//

import UIKit


class BuildingViewTileCell: UICollectionViewCell {
    
    @IBOutlet weak var buildingTileStack: UIStackView!
    @IBOutlet weak var buildingLabel: UILabel!
    
    @IBOutlet weak var firstIssuePreview: UITextView!
    @IBOutlet weak var secondIssuePreview: UITextView!
    @IBOutlet weak var thirdIssuePreview: UITextView!
    @IBOutlet weak var fourthIssuePreview: UITextView!
    @IBOutlet weak var issuePreviewStack: UIStackView!
    
    @IBOutlet weak var swipeBarLabel: UILabel!
    @IBOutlet weak var recentIssueLabel: UILabel!

    @IBOutlet weak var roundLabelStack: UIStackView!
    @IBOutlet weak var round1Label: UILabel!
    @IBOutlet weak var round2Label: UILabel!
    @IBOutlet weak var round3Label: UILabel!

    @IBOutlet weak var roundStarStack: UIStackView!
    
    @IBOutlet weak var roundSwipeBar: UIImageView!
    
    @IBOutlet weak var roundStar1Image: UIImageView!
    @IBOutlet weak var roundStar2Image: UIImageView!
    @IBOutlet weak var roundStar3Image: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}

