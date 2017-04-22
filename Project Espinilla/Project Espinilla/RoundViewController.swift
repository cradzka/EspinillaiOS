//
//  RoundViewController.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/26/17.
//  Copyright © 2017 Carter Radzka. All rights reserved.
//

import UIKit

class RoundViewController: BaseViewController {
    
    @IBOutlet var initialView: UIView!
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    var collectionDelegate: UICollectionViewDelegate!
    var buildingNames: Array<String> = ["West", "Presidents", "Driscoll"]
    var dataAndDelegate: RoundCollectionViewDataSource!
    var buildingIssueLists: [String: Array<String>] = [:]
    var designValues = UIDesignValue.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillBuildingLists(buildings: self.buildingNames)
        
        initialCollectionView.backgroundColor = designValues.backgroundColor
        initialCollectionView!.register(UINib(nibName: "BuildingViewTileCell", bundle: nil), forCellWithReuseIdentifier: "BuildingViewTileCell")
        initialCollectionView!.register(UINib(nibName: "BuildingTileCollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader")
        
        dataAndDelegate = RoundCollectionViewDataSource(numberOfBuildings: buildingNames.count,buildingNameList: buildingNames, issueDictionary: buildingIssueLists,collectionLayout: initialCollectionViewLayout)
        
        initialCollectionView.dataSource = dataAndDelegate
        initialCollectionView.delegate = dataAndDelegate
        
        initialCollectionViewLayout.minimumLineSpacing = designValues.spaceBetweenLines
        initialStackView.addArrangedSubview(initialCollectionView)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated."UICollectionElementKindSectionHeader"
    }
}
