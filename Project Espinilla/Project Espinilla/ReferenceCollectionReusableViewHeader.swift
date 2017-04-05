//
//  ReferenceCollectionReusableViewHeader.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 4/1/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class ReferenceCollectionReusableViewHeader: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
