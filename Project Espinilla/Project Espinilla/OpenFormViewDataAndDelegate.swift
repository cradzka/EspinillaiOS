////
////  OpenFormViewDataAndDelegate.swift
////  Project Espinilla
////
////  Created by Raj Singh on 4/20/17.
////  Copyright © 2017 Matthew Crepeau. All rights reserved.
////
//
//import UIKit
//
//
//
//class OpenFormViewDataAndDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate  {
//    
//      var sections = 1
//      var items: Int
//    
//      var collectionLayout: UICollectionViewLayout
//      var cellInitializationIndex: Int
// 
//    init(collectionLayout: UICollectionViewLayout) {
//        self.items = 1
//        self.collectionLayout = collectionLayout
//        self.cellInitializationIndex = 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
//        return self.items
//    }
//    
//    func numberOfSections(in: UICollectionView) -> Int {
//        return self.sections
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionDivider", for: indexPath) as! SectionDivider
//        
//        cell.SectionName.text = "General"
//        cell.Border.backgroundColor = UIColor.black
//        
//        return cell
//
//    }
//    
//}
