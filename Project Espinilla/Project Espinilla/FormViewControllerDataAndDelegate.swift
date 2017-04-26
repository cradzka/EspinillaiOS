//
//  FormViewControllerDataAndDelegate.swift
//  Project Espinilla
//
//  Created by Raj Singh on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class FormViewControllerDataAndDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sections = 2
    var items: Int
    var formNames: Array<String>
    var fieldsLeft: Array<String>
    var halls: Array<String>
    var RAs: Array<String>
    var sectionNames: Array<String>

    var cellInitializationIndex: Int
    var collectionLayout: UICollectionViewLayout
    var designValue: UIDesignValue
    var shadowLayer: CAShapeLayer!
    
    //ToDo: Add init arguments for issue lists and GPS locations info
    init(collectionLayout: UICollectionViewLayout, formNames: Array<String>, fieldsLeft: Array<String>, sectionNames: Array<String>, halls: Array<String>, RAs: Array <String>) {
        self.items = 3
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
        self.formNames = formNames
        self.sectionNames = sectionNames
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
      
        cell.layer.shadowColor = designValue.shadowColor
        cell.layer.shadowOffset = designValue.shadowOffset
        cell.layer.shadowRadius = designValue.shadowRadius
        cell.layer.shadowOpacity = designValue.shadowOpacity
        
        cell.layer.borderWidth = designValue.boarderWidth
        cell.layer.borderColor = designValue.boarderColor
        
        cell.layer.masksToBounds = false
        
        cell.formStackView.addArrangedSubview(cell.FormName)
        cell.formStackView.addArrangedSubview(cell.Hall)
        cell.formStackView.addArrangedSubview(cell.RAName)
        cell.contentView.addSubview(cell.formStackView)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeader", for: at) as! FormHeader
            
        headerView.headerLabel.text = sectionNames[at.section]
        headerView.headerLabel.font = designValue.fieldTextFont
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(headerView.headerLabel)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
    }
    
}


