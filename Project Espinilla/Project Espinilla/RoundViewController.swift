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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        areaLabel.text = "Your Area"
        initialCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: initialCollectionViewLayout)
        //initialCollectionView.dataSource = self
        //initialCollectionView.delegate = initialCollectionView.delegate
        initialCollectionView.backgroundColor = UIColor.clear
        initialCollectionView!.register(UINib(nibName: "BuildingViewTileCell", bundle: nil), forCellWithReuseIdentifier: "BuildingViewTileCell")
        
        //let cell = initialCollectionView.dequeueReusableCellWithReuseIdentifier("BuildingViewTileCell", forIndexPath: indexPath) as! BuildingViewTileCell
       
        
        initialStackView.addArrangedSubview(areaLabel)
        initialStackView.addArrangedSubview(cell)
        
        initialView.addSubview(initialStackView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
