//
//  RoundCollectionViewDataSource.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit


class RoundCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sections = 1
    var items: Int
    var names: Array<String>
    var cellInitializationIndex: Int
    var collectionLayout: UICollectionViewLayout
    var issueDictionary: [String: [String]]
    
    //ToDo: Add init arguemnts for issue lists and GPS locations info
    init(numberOfBuildings: Int, buildingNameList: Array<String>, issueDictionary: [String: [String]],collectionLayout: UICollectionViewLayout) {
        self.items = numberOfBuildings
        self.names = buildingNameList
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
        self.issueDictionary = issueDictionary
    }
    
    

    /*
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt: IndexPath) -> Bool {
        
        return false
    }
 */
    
    /*
    func collectionView(_ collectionView: UICollectionView, moveItemAt: IndexPath, to: IndexPath) {
        
    }
 */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return self.items
    }
    
    func numberOfSections(in: UICollectionView) -> Int {
        return self.sections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let buildingName = self.names[indexPath.row]
        let buildingIssueList = self.issueDictionary[buildingName]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildingViewTileCell", for: indexPath) as! BuildingViewTileCell

        cell.buildingLabel.text = names[indexPath.row]
        cell.buildingLabel.font = UIFont.init(name: "Gill Sans", size: 23.0)
        cell.buildingLabel.layer.borderColor = UIColor.black.cgColor
        cell.buildingLabel.layer.borderWidth = 0.35
        cell.buildingLabel.layer.cornerRadius = 8
        cell.buildingTileStack.addArrangedSubview(cell.buildingLabel)
        
        cell.firstIssuePreview.text = buildingIssueList?[0]
        cell.secondIssuePreview.text = buildingIssueList?[1]
        cell.thirdIssuePreview.text = buildingIssueList?[2]
        cell.firstIssuePreview.textColor = UIColor.blue
        cell.secondIssuePreview.textColor = UIColor.green
        cell.thirdIssuePreview.textColor = UIColor.purple
        cell.issuePreviewStack.addArrangedSubview(cell.recentIssueLabel)
        cell.issuePreviewStack.addArrangedSubview(cell.firstIssuePreview)
        cell.issuePreviewStack.addArrangedSubview(cell.secondIssuePreview)
        cell.issuePreviewStack.addArrangedSubview(cell.thirdIssuePreview)
        cell.buildingTileStack.addArrangedSubview(cell.issuePreviewStack)
        
        cell.round1Label.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.round2Label.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.round3Label.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.round1Label.text = "Round #1"
        cell.round2Label.text = "Round #2"
        cell.round3Label.text = "Round #3"
        
        cell.roundLabelStack.addArrangedSubview(cell.round1Label)
        cell.roundLabelStack.addArrangedSubview(cell.round2Label)
        cell.roundLabelStack.addArrangedSubview(cell.round3Label)
        cell.buildingTileStack.addArrangedSubview(cell.roundLabelStack)
        
        cell.roundStar1Image.image = #imageLiteral(resourceName: "checkMark")
        cell.roundStar2Image.image = #imageLiteral(resourceName: "checkMark")
        cell.roundStar3Image.image = #imageLiteral(resourceName: "checkMark")
        
        cell.roundLabelStack.addArrangedSubview(cell.roundStar1Image)
        cell.roundLabelStack.addArrangedSubview(cell.roundStar2Image)
        cell.roundLabelStack.addArrangedSubview(cell.roundStar3Image)
        cell.roundSwipeBar.image = #imageLiteral(resourceName: "outOfRangeImage")
        cell.buildingTileStack.addArrangedSubview(cell.roundSwipeBar)
        
        cell.contentView.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.35
        cell.layer.cornerRadius = 8
        cell.contentView.addSubview(cell.buildingTileStack)
        cell.contentView.addSubview(cell.swipeBarLabel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader", for: at) as! BuildingTileCollectionViewHeader
        headerView.backgroundColor = UIColor.lightGray

        return headerView
    }
}
