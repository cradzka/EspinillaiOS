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
    var designValue: UIDesignValue
    var shadowLayer: CAShapeLayer!
    var tapRecognizer: UITapGestureRecognizer
    
    //ToDo: Add init arguemnts for issue lists and GPS locations info
    init(numberOfBuildings: Int, buildingNameList: Array<String>, issueDictionary: [String: [String]],collectionLayout: UICollectionViewLayout) {
        self.items = numberOfBuildings
        self.names = buildingNameList
        self.cellInitializationIndex = 0
        self.collectionLayout = collectionLayout
        self.issueDictionary = issueDictionary
        self.designValue = UIDesignValue.init()
        
        self.tapRecognizer = UITapGestureRecognizer()
        self.tapRecognizer.numberOfTapsRequired = 1
        self.tapRecognizer.cancelsTouchesInView = false
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

        /***********************
         * Building Label init *
         *                     */
        cell.buildingLabel.text = names[indexPath.row]
        cell.buildingLabel.textColor = UIColor.white
        cell.buildingLabel.font = designValue.sectionLabelFont
        cell.buildingLabel.backgroundColor = designValue.baseViewPrimaryColor
        cell.buildingLabel.layer.borderColor = designValue.boarderColor
        cell.buildingLabel.layer.borderWidth = designValue.boarderWidth + 0.4
        //cell.buildingLabel.layer.cornerRadius = designValue.cornerRadius
        cell.buildingTileStack.addArrangedSubview(cell.buildingLabel)
        
        /********************
         * Issue stack init *
         *                  */
        cell.firstIssuePreview.text = buildingIssueList?[0]
        cell.secondIssuePreview.text = buildingIssueList?[1]
        cell.thirdIssuePreview.text = buildingIssueList?[2]
        cell.fourthIssuePreview.text = buildingIssueList?[3]
        
        cell.firstIssuePreview.backgroundColor = UIColor.white
        cell.secondIssuePreview.backgroundColor = UIColor.lightGray
        cell.thirdIssuePreview.backgroundColor = UIColor.white
        cell.fourthIssuePreview.backgroundColor = UIColor.lightGray
        
        cell.firstIssuePreview.textContainer.maximumNumberOfLines = 2
        cell.secondIssuePreview.textContainer.maximumNumberOfLines = 2
        cell.thirdIssuePreview.textContainer.maximumNumberOfLines = 2
        cell.fourthIssuePreview.textContainer.maximumNumberOfLines = 2
        
        cell.firstIssuePreview.layer.borderWidth = designValue.boarderWidth
        cell.secondIssuePreview.layer.borderWidth = designValue.boarderWidth
        cell.thirdIssuePreview.layer.borderWidth = designValue.boarderWidth
        cell.fourthIssuePreview.layer.borderWidth = CGFloat(0.7)
        
        cell.firstIssuePreview.layer.borderColor = designValue.boarderColor
        cell.secondIssuePreview.layer.borderColor = designValue.boarderColor
        cell.thirdIssuePreview.layer.borderColor = designValue.boarderColor
        cell.fourthIssuePreview.layer.borderColor = designValue.boarderColor
        
        cell.firstIssuePreview.textContainer.lineBreakMode = .byTruncatingTail
        cell.secondIssuePreview.textContainer.lineBreakMode = .byTruncatingTail
        cell.thirdIssuePreview.textContainer.lineBreakMode = .byTruncatingTail
        cell.fourthIssuePreview.textContainer.lineBreakMode = .byTruncatingTail
        
        //cell.firstIssuePreview.addGestureRecognizer(self.tapRecognizer)
        
        cell.issuePreviewStack.addArrangedSubview(cell.firstIssuePreview)
        cell.issuePreviewStack.addArrangedSubview(cell.secondIssuePreview)
        cell.issuePreviewStack.addArrangedSubview(cell.thirdIssuePreview)
        cell.issuePreviewStack.addArrangedSubview(cell.fourthIssuePreview)
        cell.buildingTileStack.addArrangedSubview(cell.issuePreviewStack)
        
        /**************************
         * Round label stack init *
         *                        */
        cell.round1Label.font = designValue.labelFont
        cell.round2Label.font = designValue.labelFont
        cell.round3Label.font = designValue.labelFont
        cell.round1Label.text = "Round #1"
        cell.round2Label.text = "Round #2"
        cell.round3Label.text = "Round #3"
        
        cell.roundLabelStack.addArrangedSubview(cell.round1Label)
        cell.roundLabelStack.addArrangedSubview(cell.round2Label)
        cell.roundLabelStack.addArrangedSubview(cell.round3Label)
        cell.roundLabelStack.layer.borderWidth = designValue.boarderWidth
        cell.roundLabelStack.layer.borderColor = designValue.boarderColor
        cell.buildingTileStack.addArrangedSubview(cell.roundLabelStack)
        
        cell.roundStar1Image.image = #imageLiteral(resourceName: "checkMark")
        cell.roundStar2Image.image = #imageLiteral(resourceName: "checkMark")
        cell.roundStar3Image.image = #imageLiteral(resourceName: "checkMark")
        
        cell.roundLabelStack.addArrangedSubview(cell.roundStar1Image)
        cell.roundLabelStack.addArrangedSubview(cell.roundStar2Image)
        cell.roundLabelStack.addArrangedSubview(cell.roundStar3Image)
        cell.roundSwipeBar.image = #imageLiteral(resourceName: "outOfRangeImage")
        cell.roundSwipeBar.layer.borderWidth = designValue.boarderWidth + 0.30
        cell.buildingTileStack.addArrangedSubview(cell.roundSwipeBar)
        
        /***************************
         * Content view formatting *
         *                         */
        cell.contentView.backgroundColor = designValue.baseCellColor
        cell.layer.borderColor = designValue.boarderColor
        cell.layer.borderWidth = designValue.boarderWidth
    
        cell.layer.shadowRadius = designValue.shadowRadius
        cell.layer.shadowOffset = designValue.shadowOffset
        cell.layer.shadowOpacity = designValue.shadowOpacity
        cell.layer.shadowColor = designValue.shadowColor

        cell.contentView.addSubview(cell.buildingTileStack)
        cell.contentView.addSubview(cell.swipeBarLabel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader", for: at) as! BuildingTileCollectionViewHeader
        headerView.backgroundColor = designValue.backgroundColor

        return headerView
    }
}
