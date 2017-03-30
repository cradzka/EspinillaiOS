//
//  BuildigTileCollectionViewHeader.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit


class BuildingTileCollectionViewHeader: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
