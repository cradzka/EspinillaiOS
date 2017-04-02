//
//  FirstViewController.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 2/22/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    @IBOutlet weak var MainCollectionViewLayout:UICollectionViewFlowLayout!

    var dataAndDelegate: FormViewControllerDataAndDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainCollectionView.backgroundColor = UIColor.lightGray
        MainCollectionView.register(UINib(nibName: "FormTileCell", bundle: nil), forCellWithReuseIdentifier: "FormTileCell")
        // Do any additional setup after loading the view, typically from a nib.
        MainCollectionView.setCollectionViewLayout(MainCollectionViewLayout, animated: false)
        
        dataAndDelegate = FormViewControllerDataAndDelegate(collectionLayout:MainCollectionViewLayout)
        MainCollectionView.dataSource = dataAndDelegate
        MainCollectionView.delegate = dataAndDelegate
        
        MainCollectionViewLayout.minimumLineSpacing = 30
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

