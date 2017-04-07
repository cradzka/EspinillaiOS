//
//  ReferenceCollectionViewDataSourceAndDelegate.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class ReferenceCollectionViewDataSourceAndDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    var sections = 3
    var items: Int
    var sectionNames: Array<String>
    var cellInitializationIndex: Int
    var collectionLayout: UICollectionViewLayout
    var sectionDictionary: [String: [String]]
    
    init(numberOfCategories: Int, sectionNameList: Array<String>, sectionDictionary: [String : [String]], collectionLayout: UICollectionViewLayout) {
        self.items = numberOfCategories
        self.sectionNames = sectionNameList
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
        self.sectionDictionary = sectionDictionary
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return self.items
    }
    
    func numberOfSections(in: UICollectionView) -> Int {
        return self.sections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReferenceCell", for: indexPath) as! ReferenceCell
        
        let sectionName = self.sectionNames[indexPath.section]
        let subsectionNames = self.sectionDictionary[sectionName]

        cell.ReferenceLabel.text = subsectionNames?[indexPath.row]
        cell.ReferenceLabel.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.contentView.backgroundColor = UIColor.lightGray
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceLabel)
        
        cell.ReferenceImageView.image = #imageLiteral(resourceName: "refImage")
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceImageView)
        
        cell.backgroundColor = UIColor.blue
        if cell.isSelected {
            cell.backgroundColor = UIColor.white
            cell.contentView.backgroundColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.blue
            cell.contentView.backgroundColor = UIColor.blue
        }
        
        cell.contentView.addSubview(cell.ReferenceCellStack)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ReferenceCell
        cell.backgroundColor = UIColor.white
        cell.contentView.backgroundColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ReferenceCell
        cell.backgroundColor = UIColor.blue
        cell.contentView.backgroundColor = UIColor.blue
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader", for: at) as! ReferenceCollectionReusableViewHeader
        headerView.headerLabel.text = sectionNames[at.section]
        headerView.headerLabel.font = UIFont.init(name: "Gill Sans", size: 17.0)
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(headerView.headerLabel)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
    }
}
