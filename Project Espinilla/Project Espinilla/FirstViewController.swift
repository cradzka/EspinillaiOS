
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
    
    var dataAndDelegate: FormViewControllerDataAndDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainCollectionView.backgroundColor = UIColor.lightGray
        MainCollectionView.register(UINib(nibName: "FormTileCell", bundle: nil), forCellWithReuseIdentifier: "formTileCell")
        // Do any additional setup after loading the view, typically from a nib.
        
        dataAndDelegate = FormViewControllerDataAndDelegate(collectionLayout: MainCollectionViewLayout)
        MainCollectionView.dataSource = dataAndDelegate
        MainCollectionView.delegate = dataAndDelegate
        
        MainCollectionViewLayout.minimumLineSpacing = 30
        
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

