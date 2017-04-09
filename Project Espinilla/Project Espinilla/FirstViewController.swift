
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

    //@IBOutlet weak var SlideOut: UIImageView!
    
    //let tapRec = UITapGestureRecognizer()
    
    var formNames = ["Housing Survey", "Lockout Form", "Violation Form", "Other Form", "Housing Cancellation"]
    var fieldsLeft = ["10 Fields Remaining", "12 Fields Remaining", "5 Fields Remaining", "Complete!", "4 Fields Remaining"]
    var halls = ["Driscoll", "Torres", "Baca", "Presidents", "Alta"]
    var RAs = ["Carter", "Raj", "Kristina", "Matt", "Raj"]
    
    var designValues = UIDesignValue.init()

    
    var dataAndDelegate: FormViewControllerDataAndDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainCollectionView.backgroundColor = UIColor.lightGray
        MainCollectionView.register(UINib(nibName: "FormTileCell", bundle: nil), forCellWithReuseIdentifier: "formTileCell")
        // Do any additional setup after loading the view, typically from a nib.
        
        dataAndDelegate = FormViewControllerDataAndDelegate(collectionLayout: MainCollectionViewLayout, formNames: formNames, fieldsLeft: fieldsLeft, halls: halls, RAs: RAs)
        MainCollectionView.dataSource = dataAndDelegate
        MainCollectionView.delegate = dataAndDelegate
        
        MainCollectionViewLayout.minimumLineSpacing = designValues.spaceBetweenLines
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.didTap(_:)))

        MainCollectionView.isUserInteractionEnabled = true
        MainCollectionView.addGestureRecognizer(tapGestureRecognizer)
        
        //tapRec.addTarget(self, action: #selector(FirstViewController.tappedView))
        //SlideOut.addGestureRecognizer(tapRec)
        
    }
    
    
    func didTap(_ sender: UITapGestureRecognizer) {
        _ = sender.location(in: view)
        print("image tapped")
    }
    

    func tappedView(){
        print("image tapped")
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

