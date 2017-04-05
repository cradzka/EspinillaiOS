//
//  RoundViewController.swift
//  Project_Espinilla
//
//  Created by Carter Radzka on 3/26/17.
//  Copyright © 2017 Carter Radzka. All rights reserved.
//

import UIKit

class RoundViewController: UIViewController {
    
    @IBOutlet var initialView: UIView!
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    var collectionDelegate: UICollectionViewDelegate!
    var buildingNames: Array<String> = ["West", "Presidents", "Driscoll"]
    var dataAndDelegate: RoundCollectionViewDataSource!
    var buildingIssueLists: [String: Array<String>] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillBuildingLists(buildings: self.buildingNames)
        
        initialCollectionView.backgroundColor = UIColor.lightGray
        initialCollectionView!.register(UINib(nibName: "BuildingViewTileCell", bundle: nil), forCellWithReuseIdentifier: "BuildingViewTileCell")
        initialCollectionView!.register(UINib(nibName: "BuildingTileCollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader")
        
        dataAndDelegate = RoundCollectionViewDataSource(numberOfBuildings: buildingNames.count,buildingNameList: buildingNames, issueDictionary: buildingIssueLists,collectionLayout: initialCollectionViewLayout)
        
        initialCollectionView.dataSource = dataAndDelegate
        initialCollectionView.delegate = dataAndDelegate
        
        initialCollectionViewLayout.minimumLineSpacing = 30
        initialStackView.addArrangedSubview(initialCollectionView)
    }
    
    //initialize dictionary of building names where each containes it's issue previews. **Hardcoded for now**
    func fillBuildingLists(buildings: Array<String>) {
    
        var west: Array<String>
        var pres: Array<String>
        var drisc: Array<String>
        
        west = Array<String>()
        west.append("[Carter]: Slow water leak in second floor bathroom. sheeeeeeeeeeeeeeeeeeeeeiudsh fjdhsfdskjf dskjfh jkf fjh fjkdhfjkdsfhkjsd hjkdsf hdsjkf hdsjkf hdsjkf hdsjkf hdsjkfh dskjfh dskjf hdsjkf shkjf dhskjf")
        west.append("[Aaron]: Foul oder in lower lounge.")
        west.append("[Valentine]: 2nd floor east wing air conditioning not working.")
        
        drisc = Array<String>()
        drisc.append("[Lynda]: Slow water leak in second floor bathroom.")
        drisc.append("[Valentine]: Foul oder in lower lounge.")
        drisc.append("[Valentine]: 2nd floor east wing air conditioning not working.")
        
        
        pres = Array<String>()
        pres.append("[Lynda]: Slow water leak in second floor bathroom.")
        pres.append("[Valentine]: Foul oder in lower lounge.")
        pres.append("[Valentine]: 2nd floor east wing air conditioning not working.")
        
        self.buildingIssueLists[buildings[0]] = west
        self.buildingIssueLists[buildings[1]] = pres
        self.buildingIssueLists[buildings[2]] = drisc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated."UICollectionElementKindSectionHeader"
    }
}
