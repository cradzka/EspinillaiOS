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
    @IBOutlet var initialView: UIView!
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    
    var collectionDelegate: UICollectionViewDelegate!
    var sectionHeaders: Array<String> = ["Conflict Resolution", "Crisis Prevention", "Rules and Regulations"]
    var subsectionList: [String: Array<String>] = [:]
    //var categoryNames: Array<String> = ["Conflict Resolution", "Crisis Prevention", "Rules and Regulations", "Tim's Diary", "Miscellaneous"]
    var conflictResolutionNames: Array<String> = ["Roomate Conflicts", "Noise Complaints", "Party Busting", "Confrontation"]
    var crisisPreventionNames: Array<String> = ["Suicidal Resident", "Medical Emergency", "Academic Crisis", "Prevention"]
    var rulesAndRegulationsNames: Array<String> = ["Other", "Kristina", "Tim"]
    
    var dataAndDelegate: ReferenceCollectionViewDataSourceAndDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fillsubsectionLists(sections: self.sectionHeaders)
        
        initialCollectionView.backgroundColor = UIColor.lightGray
        initialCollectionView!.register(UINib(nibName: "ReferenceCell", bundle: nil), forCellWithReuseIdentifier: "ReferenceCell")
        initialCollectionView!.register(UINib(nibName: "ReferenceCollectionReusableViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader")
        initialCollectionView.setCollectionViewLayout(initialCollectionViewLayout, animated: false)
        
        dataAndDelegate = ReferenceCollectionViewDataSourceAndDelegate(numberOfCategories: sectionHeaders.count, sectionNameList: sectionHeaders, sectionDictionary: subsectionList, collectionLayout: initialCollectionViewLayout)
        initialCollectionView.dataSource = dataAndDelegate
        initialCollectionView.delegate = dataAndDelegate
        
        initialStackView.addArrangedSubview(initialCollectionView)
    }
    
    //initialize dictionary of building names where each containes it's issue previews. **Hardcoded for now**
    func fillsubsectionLists(sections: Array<String>) {
        
        var conflictResolution: Array<String>
        var crisisPrevention: Array<String>
        var rulesRegulations: Array<String>
        
        conflictResolution = Array<String>()
        conflictResolution = conflictResolutionNames
        
        crisisPrevention = Array<String>()
        crisisPrevention = crisisPreventionNames
        
        rulesRegulations = Array<String>()
        rulesRegulations = rulesAndRegulationsNames
        
        self.subsectionList[sectionHeaders[0]] = conflictResolution
        self.subsectionList[sectionHeaders[1]] = crisisPrevention
        self.subsectionList[sectionHeaders[2]] = rulesRegulations
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
