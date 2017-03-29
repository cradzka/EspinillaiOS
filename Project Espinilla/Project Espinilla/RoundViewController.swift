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
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    var collectionDelegate: UICollectionViewDelegate!
    var indexPath: IndexPath!
    var buildingNames: Array<String> = ["West", "President's", "Driscoll"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialCollectionView.backgroundColor = UIColor.clear
        initialCollectionView!.register(UINib(nibName: "BuildingViewTileCell", bundle: nil), forCellWithReuseIdentifier: "BuildingViewTileCell")
        
        initialCollectionView.dataSource = RoundCollectionViewDataSource(numberOfBuildings: buildingNames.count, buildingNameList: buildingNames)
        //collectionDelegate = initialCollectionView.delegate
        
        areaLabel.text = "Your Area"
        initialStackView.addArrangedSubview(areaLabel)
        initialStackView.addArrangedSubview(initialCollectionView)
        initialView.addSubview(initialStackView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
