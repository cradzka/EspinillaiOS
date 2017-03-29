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
    
    @IBOutlet weak var issueTableView: UITableView!
    
    @IBOutlet weak var roundLabelStack: UIStackView!
    @IBOutlet weak var round1Label: UILabel!
    @IBOutlet weak var round2Label: UILabel!
    @IBOutlet weak var round3Label: UILabel!
    
    @IBOutlet weak var roundStarStack: UIStackView!
    
    @IBOutlet weak var roundSwipeBar: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buildingLabel.text = "West"
        
        round1Label.text = "Round #1"
        round2Label.text = "Round #2"
        round3Label.text = "Round #3"
        
        buildingTileStack.addArrangedSubview(buildingLabel)
        buildingTileStack.addArrangedSubview(issueTableView)
        buildingTileStack.addArrangedSubview(roundLabelStack)
        buildingTileStack.addArrangedSubview(roundSwipeBar)
        
        roundLabelStack.addArrangedSubview(round3Label)
        roundLabelStack.addArrangedSubview(round2Label)
        roundLabelStack.addArrangedSubview(round1Label)
        
    }
}
