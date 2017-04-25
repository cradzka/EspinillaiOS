//
//  Issue.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/24/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class Issue {
    var id: Int!
    var date: String!
    var building: String!
    var author: String!
    var location: String!
    var bodyText: String!
    var zoneImage: UIImage!
    
    init(id: Int,
         date: String,
         building: String,
         author: String,
         location: String,
         bodyText: String,
         zoneImage: UIImage) {
        
        self.id = id
        self.date = date
        self.building = building
        self.author = author
        self.location = location
        self.bodyText = bodyText
        self.zoneImage = zoneImage
    }
    
    func getDate() -> String {
        return self.date
    }
    
    func getAuthor() -> String {
        return self.author
    }
    
    func getLocation() -> String {
        return self.location
    }
    
    func getBody() -> String {
        return self.bodyText
    }
    
    func getZoneImage() -> UIImage {
        return self.zoneImage
    }
}
