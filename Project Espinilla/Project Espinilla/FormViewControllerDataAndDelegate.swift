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
    var formNames: Array<String>
    var fieldsLeft: Array<String>
    var halls: Array<String>
    var RAs: Array<String>
    var cellInitializationIndex: Int
    var collectionLayout: UICollectionViewLayout
    var designValue: UIDesignValue
    var shadowLayer: CAShapeLayer!
    
    //ToDo: Add init arguments for issue lists and GPS locations info
    init(collectionLayout: UICollectionViewLayout, formNames: Array<String>, fieldsLeft: Array<String>, halls: Array<String>, RAs: Array <String>) {
        self.items = 5
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
        self.formNames = formNames
        self.fieldsLeft = fieldsLeft
        self.halls = halls
        self.RAs = RAs
        self.designValue = UIDesignValue.init()

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
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "formTileCell", for: indexPath) as! FormTileCell

        cell.FormName.font = UIFont.boldSystemFont(ofSize: 18)
        cell.FieldsLeft.font = designValue.fieldTextFont
        cell.Hall.font = designValue.fieldTextFont
        cell.RAName.font = designValue.fieldTextFont
        

        
        cell.FormName.text = formNames[indexPath.row]
        cell.FieldsLeft.text = fieldsLeft[indexPath.row]
        cell.FieldsLeft.textColor = UIColor.red
        cell.Hall.text = halls[indexPath.row]
        cell.RAName.text = RAs[indexPath.row]
        cell.SlideOut.image = #imageLiteral(resourceName: "3Dots")
        cell.backgroundColor = UIColor.white

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: cell.layer.bounds, cornerRadius: designValue.cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            
            shadowLayer.shadowColor = designValue.shadowColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = designValue.shadowOffset
            shadowLayer.shadowOpacity = designValue.shadowOpacity
            shadowLayer.shadowRadius = designValue.shadowRadius
        }
        
        cell.layer.mask = shadowLayer.mask
        
        cell.formStackView.addArrangedSubview(cell.FormName)
        //cell.formStackView.addArrangedSubview(cell.FieldsLeft)
        cell.formStackView.addArrangedSubview(cell.Hall)
        cell.formStackView.addArrangedSubview(cell.RAName)
        //cell.formStackView.addArrangedSubview(cell.SlideOut)
        cell.contentView.addSubview(cell.formStackView)

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
