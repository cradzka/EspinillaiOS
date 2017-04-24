//
//  RoundViewController.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/26/17.
//  Copyright © 2017 Carter Radzka. All rights reserved.
//

import UIKit

class RoundViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet var initialView: UIView!
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    var collectionDelegate: UICollectionViewDelegate!
    var buildingNames: Array<String> = ["West", "Presidents", "Driscoll"]
    var buildingIssueLists: [String: Array<String>] = [:]
    var indexPath = IndexPath.init()
    var designValue = UIDesignValue.init()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.addSlideMenuButton()
        
        fillBuildingLists(buildings: self.buildingNames)
        
        initialCollectionView.backgroundColor = designValue.backgroundColor
        initialCollectionView!.register(UINib(nibName: "BuildingViewTileCell", bundle: nil), forCellWithReuseIdentifier: "BuildingViewTileCell")
        initialCollectionView!.register(UINib(nibName: "BuildingTileCollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader")
        
        initialCollectionView.dataSource = self
        initialCollectionView.delegate = self
        initialCollectionViewLayout.minimumLineSpacing = designValue.spaceBetweenLines
        initialStackView.addArrangedSubview(initialCollectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated."UICollectionElementKindSectionHeader"
    }
    
    //initialize dictionary of building names where each containes it's issue previews. **Hardcoded for now**
    func fillBuildingLists(buildings: Array<String>) {
    
        var west: Array<String>
        var pres: Array<String>
        var drisc: Array<String>
        
        west = Array<String>()
        west.append("[Carter]<3/31/17>: Slow water leak in second floor bathroom. sheiudsh fjdhsfdskjf dskjfh jkf fjh fjkdhfjkdsfhkjsd hjkdsf hdsjkf hdsjkf hdsjkf hdsjkf hdsjkfh dskjfh dskjf hdsjkf shkjf dhskjf")
        west.append("[Aaron]<3/23/17>: Foul oder in lower lounge.")
        west.append("[Valentine]<3/22/17>: 2nd floor east wing air conditioning not working.")
        west.append("[Illiana]<3/22/17>: Presidents' basement bathroom has toilet that won't stop running.")
        
        drisc = Array<String>()
        drisc.append("[Lynda]<4/1/17>: Slow water leak in second floor bathroom.")
        drisc.append("[Valentine]<3/31/17>: Foul oder in lower lounge.")
        drisc.append("[Valentine]<3/24/17>: 2nd floor east wing air conditioning not working.")
        drisc.append("[Andrew]<3/23/17>: Air conditioning system making loud rattling sound at almost every hour of the night.")
        
        
        pres = Array<String>()
        pres.append("[Lynda]<4/1/17>: Slow water leak in second floor bathroom.")
        pres.append("[Lynda]<3/29/17>: Foul oder in lower lounge.")
        pres.append("[Aaron]<3/19/17>: 2nd floor east wing air conditioning not working.")
        pres.append("[Carter]<2/28/17>: Lock front door has trouble opening.")
        
        self.buildingIssueLists[buildings[0]] = west
        self.buildingIssueLists[buildings[1]] = pres
        self.buildingIssueLists[buildings[2]] = drisc
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return self.buildingNames.count
    }
    
    func numberOfSections(in: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let buildingName = self.buildingNames[indexPath.row]
        let buildingIssueList = self.buildingIssueLists[buildingName]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildingViewTileCell", for: indexPath) as! BuildingViewTileCell
        let firstPreviewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        let secondPreviewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        let thirdPreviewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        let fourthPreviewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        
        /***********************
         * Building Label init *
         *                     */
        cell.buildingLabel.text = buildingNames[indexPath.row]
        cell.buildingLabel.textColor = UIColor.white
        cell.buildingLabel.font = designValue.sectionLabelFont
        cell.buildingLabel.backgroundColor = designValue.baseViewPrimaryColor
        cell.buildingLabel.layer.borderColor = designValue.boarderColor
        cell.buildingLabel.layer.borderWidth = designValue.boarderWidth + 0.4
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
        
        cell.firstIssuePreview.addGestureRecognizer(firstPreviewTapRecognizer)
        cell.secondIssuePreview.addGestureRecognizer(secondPreviewTapRecognizer)
        cell.thirdIssuePreview.addGestureRecognizer(thirdPreviewTapRecognizer)
        cell.fourthIssuePreview.addGestureRecognizer(fourthPreviewTapRecognizer)
        
        firstPreviewTapRecognizer.cancelsTouchesInView = false
        secondPreviewTapRecognizer.cancelsTouchesInView = false
        thirdPreviewTapRecognizer.cancelsTouchesInView = false
        fourthPreviewTapRecognizer.cancelsTouchesInView = false
        
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
    
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "openIssues", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        if(segue.identifier == "openIssues") {
            if let issueListVC = segue.destination as? BuildingIssueListViewController {
                print(segue.source)
                issueListVC.issueLists = self.buildingIssueLists
                issueListVC.buildingNames = self.buildingNames
            }
        }
    }
}


