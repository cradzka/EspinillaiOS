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
        /*
        buildingTileStack.decodeRestorableState(with: aDecoder)
        buildingLabel.decodeRestorableState(with: aDecoder)
        issueTableView.decodeRestorableState(with: aDecoder)
        roundLabelStack.decodeRestorableState(with: aDecoder)
        round1Label.decodeRestorableState(with: aDecoder)
        round2Label.decodeRestorableState(with: aDecoder)
        round3Label.decodeRestorableState(with: aDecoder)
        roundStarStack.decodeRestorableState(with: aDecoder)
        roundSwipeBar.decodeRestorableState(with: aDecoder)
        */
    }
    
    /*
    required init?(frame aFrame: CGRect) {
        super.init(frame: aFrame)
    }
    */
}

/*
 @IBInspectable
 var myInitialStackView: UIStackView? {
 get {
 return buildingTileStack
 }
 set(myInitialStackView) {
 buildingTileStack = myInitialStackView
 }
 }
 
 @IBInspectable
 var myLabelText: String? {
 get {
 return buildingLabel.text
 }
 set(myLabelText) {
 buildingLabel.text = myLabelText
 }
 }
 
 @IBInspectable
 var myTableView: UITableView? {
 get {
 return issueTableView
 }
 set(myTableView) {
 issueTableView = myTableView
 }
 }
 
 @IBInspectable
 var myRoundLabelStack: UIStackView? {
 get {
 return roundLabelStack
 }
 set(myRoundLabelStack) {
 roundLabelStack = myRoundLabelStack
 }
 }
 
 @IBInspectable
 var myRound1Label: String? {
 get {
 return round1Label.text
 }
 set(myRound1Label) {
 round1Label.text = myRound1Label
 }
 }
 
 @IBInspectable
 var myRound2Label: String? {
 get {
 return round2Label.text
 }
 set(myRound2Label) {
 round2Label.text = myRound2Label
 }
 }
 
 @IBInspectable
 var myRound3Label: String? {
 get {
 return round3Label.text
 }
 set(myRound3Label) {
 round3Label.text = myRound3Label
 }
 }
 
 @IBInspectable
 var myRoundSwipeBar: UIImage? {
 get {
 return roundSwipeBar.image
 }
 set(myRoundSwipeBar) {
 roundSwipeBar.image = myRoundSwipeBar
 }
 }
 */
