//
//  SecondViewController.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 2/22/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //@IBOutlet weak var RefLabel: UILabel!
    //@IBOutlet weak var RefDescr: UILabel!
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    var collectionDelegate: UICollectionViewDelegate!
    var categoryNames: Array<String> = ["Conflict Resolution", "Crisis Prevention", "Rules and Regulations"]
    var dataAndDelegate: ReferenceCollectionViewDataSourceAndDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialCollectionView.backgroundColor = UIColor.blue
        initialCollectionView!.register(UINib(nibName: "ReferenceCell", bundle: nil), forCellWithReuseIdentifier: "ReferenceCell")
        initialCollectionView.setCollectionViewLayout(initialCollectionViewLayout, animated: false)
        
        dataAndDelegate = ReferenceCollectionViewDataSourceAndDelegate(numberOfCategories: categoryNames.count, categoryNameList: categoryNames, collectionLayout: initialCollectionViewLayout)
        initialCollectionView.dataSource = dataAndDelegate
        initialCollectionView.delegate = dataAndDelegate
        
        initialStackView.addArrangedSubview(initialCollectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

