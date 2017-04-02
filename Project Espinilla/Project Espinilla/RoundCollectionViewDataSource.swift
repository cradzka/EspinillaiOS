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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildingViewTileCell", for: indexPath) as! BuildingViewTileCell
        
        let tableDataAndDelegate = IssuePreviewCellDataAndDelegate(issuePreviewList: self.issueDictionary[names[indexPath.row]]!, numberOfPreviews: (self.issueDictionary[names[indexPath.row]]!.count))
        

        cell.buildingLabel.text = names[indexPath.row]
        cell.buildingLabel.font = UIFont.init(name: "Gill Sans", size: 23.0)
        cell.contentView.backgroundColor = UIColor.white
        cell.buildingTileStack.addArrangedSubview(cell.buildingLabel)
        cell.buildingTileStack.addArrangedSubview(cell.issueTableView)
        
        cell.issueTableView!.register(UINib(nibName: "IssuePreviewCell", bundle: nil), forCellReuseIdentifier: "IssuePreviewBlock")
        cell.issueTableView.dataSource = tableDataAndDelegate
        cell.issueTableView.delegate = tableDataAndDelegate
        
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
        
        cell.contentView.addSubview(cell.buildingTileStack)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader", for: at) as! BuildingTileCollectionViewHeader
        headerView.backgroundColor = UIColor.lightGray

        return headerView
    }
}
