//
//  ReferenceCollectionViewDataSourceAndDelegate.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 3/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class ReferenceCollectionViewDataSourceAndDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    var sections = 1
    var items: Int
    var names: Array<String>
    var cellInitializationIndex: Int
    var collectionLayout: UICollectionViewLayout
    
    init(numberOfCategories: Int, categoryNameList: Array<String>, collectionLayout: UICollectionViewLayout) {
        self.items = numberOfCategories
        self.names = categoryNameList
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return self.items
    }
    
    func numberOfSections(in: UICollectionView) -> Int {
        return self.sections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReferenceCell", for: indexPath) as! ReferenceCell
        cell.ReferenceLabel.text = names[indexPath.row]
        cell.ReferenceLabel.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.contentView.backgroundColor = UIColor.green
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceLabel)
        
        cell.ReferenceImageView.image = #imageLiteral(resourceName: "refImage")
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceImageView)
        
        cell.contentView.addSubview(cell.ReferenceCellStack)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReferenceCell", for: at) as! ReferenceCell
        cell.ReferenceLabel.text = names[cellInitializationIndex]
        
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceLabel)
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceImageView)
        cell.contentView.addSubview(cell.ReferenceCellStack)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
    }
}
