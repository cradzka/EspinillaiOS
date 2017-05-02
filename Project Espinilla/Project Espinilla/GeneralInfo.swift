//
//  GeneralInfo.swift
//  Project Espinilla
//
//  Created by Raj Singh on 4/23/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class GeneralInfo: UICollectionViewCell{

    @IBOutlet weak var RAName: UILabel!
    @IBOutlet weak var StudentName: UILabel!
    @IBOutlet weak var HallName: UILabel!
    @IBOutlet weak var RoomNumber: UILabel!
    @IBOutlet weak var RASignature: YPDrawSignatureView!
    @IBOutlet weak var RASignaturePlace: UILabel!
    @IBOutlet weak var StudentSignaturePlace: UILabel!
    @IBOutlet weak var StudentSignature: YPDrawSignatureView!
    @IBOutlet weak var ClearSignature1: UIButton!
    @IBOutlet weak var ClearSignature2: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

  
}
