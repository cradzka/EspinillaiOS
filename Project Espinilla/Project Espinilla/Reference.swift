//
//  Reference.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 4/25/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class Reference {
    var name: String!
    var dosText: String!
    var dontsText: String!
    var contentText: String!
    
    init(name: String, dosText: String, dontsText: String, contentText: String) {
        self.name = name
        self.dosText = dosText
        self.dontsText = dontsText
        self.contentText = contentText
    }
}
