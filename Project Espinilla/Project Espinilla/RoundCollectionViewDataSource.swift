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
    
    //ToDo: Add init arguemnts for issue lists and GPS locations info
    init(numberOfBuildings: Int, buildingNameList: Array<String>) {
        self.items = numberOfBuildings
        self.names = buildingNameList
        self.cellInitializationIndex = 0
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
        print("Adding Cell\n")
        cell.contentView.addSubview(cell.buildingTileStack)
        cell.buildingLabel.text = names[indexPath.row]
        cell.contentView.backgroundColor = UIColor.white
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
        print("Cell Added\n")
        return cell
    }
    
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
}
