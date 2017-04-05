//
//  UIDesignValues.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/4/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class UIDesignValue {
    
    //Cell Design Attributes
    var backgroundColor: UIColor
    var boarderWidth: CGFloat
    var boarderColor: CGColor
    var cornerRadius: CGFloat
    var sectionLabelFont: UIFont
    var labelFont: UIFont
    var fieldTextFont: UIFont
    var baseColor: UIColor
    
    //Cell Shadow Attributes
    var shadowRadius: CGFloat
    var shadowOffset: CGSize
    var shadowOpacity: Float
    var shadowColor: CGColor
    
    var spaceBetweenLines: CGFloat
    
    init() {
            self.backgroundColor = UIColor(colorLiteralRed: 0.943, green: 0.921, blue: 0.903, alpha: 1.0)
            self.boarderWidth = 0.35
            self.boarderColor = UIColor.black.cgColor
            self.cornerRadius = 8
            self.sectionLabelFont = UIFont.init(name: "Gill Sans", size: 23.0)!
            self.labelFont = UIFont.init(name: "Gill Sans", size: 17.0)!
            self.fieldTextFont = UIFont.init(name: "Gill Sans", size: 13.0)!
            self.baseColor = UIColor.white
            self.shadowRadius = 5
            self.shadowOffset = CGSize(width: 1.5, height: 5.5)
            self.shadowOpacity = 0.40
            self.shadowColor = UIColor.black.cgColor
            self.spaceBetweenLines = 30
    }
}
