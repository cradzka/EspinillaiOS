//
//  FormViewControllerDataAndDelegate.swift
//  Project Espinilla
//
//  Created by Raj Singh on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class FormViewControllerDataAndDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sections = 1
    var items: Int
    var cellInitializationIndex: Int
    var collectionLayout: UICollectionViewLayout
    
    //ToDo: Add init arguemnts for issue lists and GPS locations info
    init(collectionLayout: UICollectionViewLayout) {
        self.items = 1
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
        

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FormTileCell", for: indexPath) as! FormTileCell
        
        cell.FormName.text = "What up"
        cell.FieldsLeft.text = "12 Fields Remaining"
        cell.Hall.text = "West Hall"
        cell.RAName.text = "hi, my name is"
        return cell
    }
}


    
            /*cell.buildingLabel.text = names[indexPath.row]
            cell.buildingLabel.font = UIFont.init(name: "Gill Sans", size: 23.0)
            cell.contentView.backgroundColor = UIColor.white
            cell.buildingTileStack.addArrangedSubview(cell.buildingLabel)
            cell.buildingTileStack.addArrangedSubview(cell.issueTableView)
            
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
        }*/
