//
//  SectionDivider.swift
//  Project Espinilla
//
//  Created by Raj Singh on 4/20/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class SectionDivider: UITableViewCell {
    
    @IBOutlet weak var SectionName: UILabel!
    @IBOutlet weak var Border: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
