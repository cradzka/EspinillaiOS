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
    
    //ToDo: Add init arguemnts for issue lists and GPS locations info
    init(numberOfBuildings: Int, buildingNameList: Array<String>, collectionLayout: UICollectionViewLayout) {
        self.items = numberOfBuildings
        self.names = buildingNameList
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
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

        cell.buildingLabel.text = names[indexPath.row]
        cell.buildingLabel.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.contentView.backgroundColor = UIColor.white
        cell.buildingTileStack.addArrangedSubview(cell.buildingLabel)
        cell.buildingTileStack.addArrangedSubview(cell.issueTableView)
        
        cell.round1Label.text = "Round #1"
        cell.round2Label.text = "Round #2"
        cell.round3Label.text = "Round #3"
        cell.round1Label.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.round2Label.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.round3Label.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.roundLabelStack.addArrangedSubview(cell.round1Label)
        cell.roundLabelStack.addArrangedSubview(cell.round2Label)
        cell.roundLabelStack.addArrangedSubview(cell.round3Label)
        cell.buildingTileStack.addArrangedSubview(cell.roundLabelStack)
        
        cell.roundSwipeBar.image = #imageLiteral(resourceName: "outOfRangeImage")
        cell.buildingTileStack.addArrangedSubview(cell.roundSwipeBar)
        
        cell.contentView.addSubview(cell.buildingTileStack)
        return cell
    }
    
    //No real implimentation yet, may not need it...?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildingViewTileCell", for: at) as! BuildingViewTileCell
        cell.buildingLabel.text = names[cellInitializationIndex]

        cell.buildingTileStack.addArrangedSubview(cell.buildingLabel)
        cell.buildingTileStack.addArrangedSubview(cell.issueTableView)
        cell.round1Label.text = "Round #1"
        cell.round2Label.text = "Round #2"
        cell.round3Label.text = "Round #3"
        cell.roundLabelStack.addArrangedSubview(cell.round1Label)
        cell.roundLabelStack.addArrangedSubview(cell.round2Label)
        cell.roundLabelStack.addArrangedSubview(cell.round3Label)
        cell.buildingTileStack.addArrangedSubview(cell.roundLabelStack)
        cell.buildingTileStack.addArrangedSubview(cell.roundSwipeBar)
        cell.contentView.addSubview(cell.buildingTileStack)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        //code
    }
}
