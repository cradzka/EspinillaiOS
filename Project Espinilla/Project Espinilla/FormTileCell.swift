//
//  FormTileCell.swift
//  Project Espinilla
//
//  Created by Raj Singh on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class FormTileCell: UICollectionViewCell {

    @IBOutlet weak var FormName: UILabel!
    
    @IBOutlet weak var RAName: UILabel!
    
    @IBOutlet weak var FieldsLeft: UILabel!
    
    @IBOutlet weak var Hall: UILabel!
    
    @IBOutlet weak var formStackView: UIStackView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
