//
//  ReferenceCell.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class ReferenceCell: UICollectionViewCell {
    
    @IBOutlet weak var ReferenceCellStack: UIStackView!
    
    @IBOutlet weak var ReferenceLabel: UILabel!
    
    @IBOutlet weak var ReferenceImageView: UIImageView!
    
    @IBOutlet weak var testButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
