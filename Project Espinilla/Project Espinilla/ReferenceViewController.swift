//
//  SecondViewController.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 2/22/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class ReferenceViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var initialView: UIView!
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var initialCollectionView: UICollectionView!
    @IBOutlet weak var initialCollectionViewLayout: UICollectionViewFlowLayout!
    
    var sections = 3
    
    var designValues = UIDesignValue.init()
    
    var collectionDelegate: UICollectionViewDelegate!
    var sectionHeaders: Array<String> = ["Conflict Resolution", "Crisis Prevention", "Rules and Regulations"]
    var subsectionList: [String: Array<String>] = [:]
    //var categoryNames: Array<String> = ["Conflict Resolution", "Crisis Prevention", "Rules and Regulations", "Tim's Diary", "Miscellaneous"]
    var conflictResolutionNames: Array<String> = ["Roomate Conflicts", "Noise Complaints", "Party Busting", "Confrontation"]
    var crisisPreventionNames: Array<String> = ["Suicidal Resident", "Medical Emergency", "Academic Crisis", "Prevention"]
    var rulesAndRegulationsNames: Array<String> = ["Other", "Kristina", "Tim", "Another"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addSlideMenuButton()
        
        fillsubsectionLists(sections: self.sectionHeaders)
        
        initialCollectionView.backgroundColor = UIColor.lightGray
        initialCollectionView!.register(UINib(nibName: "ReferenceCell", bundle: nil), forCellWithReuseIdentifier: "ReferenceCell")
        initialCollectionView!.register(UINib(nibName: "ReferenceCollectionReusableViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader")
        initialCollectionView.setCollectionViewLayout(initialCollectionViewLayout, animated: false)
        
        initialCollectionView.delegate = self
        initialCollectionView.dataSource = self
        initialCollectionView.isUserInteractionEnabled = true
        initialCollectionView.backgroundColor = designValues.backgroundColor
        initialStackView.addArrangedSubview(initialCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        if (numberOfItemsInSection == 0) {
            return conflictResolutionNames.count
        } else if (numberOfItemsInSection == 1) {
            return crisisPreventionNames.count
        } else if (numberOfItemsInSection == 2) {
            return rulesAndRegulationsNames.count
        }
        return 0
    }
    
    func numberOfSections(in: UICollectionView) -> Int {
        return self.sections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReferenceCell", for: indexPath) as! ReferenceCell
        let sectionName = self.sectionHeaders[indexPath.section]
        let subsectionNames = self.subsectionList[sectionName]
        
        cell.ReferenceLabel.text = subsectionNames?[indexPath.row]
        cell.ReferenceLabel.font = UIFont.init(name: "Gill Sans", size: 17.0)
        cell.contentView.backgroundColor = designValues.baseCellColor
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceLabel)
        
        cell.ReferenceImageView.image = #imageLiteral(resourceName: "refImage")
        cell.ReferenceCellStack.addArrangedSubview(cell.ReferenceImageView)
        
        cell.backgroundColor = designValues.baseCellColor
        
        cell.layer.shadowColor = designValues.shadowColor
        cell.layer.shadowOffset = designValues.shadowOffset
        cell.layer.shadowRadius = designValues.shadowRadius
        cell.layer.shadowOpacity = designValues.shadowOpacity
        cell.layer.borderWidth = designValues.boarderWidth
        cell.layer.borderColor = designValues.boarderColor
        cell.layer.masksToBounds = false
        
        cell.contentView.addSubview(cell.ReferenceCellStack)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind: String, at: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "initialCollectionViewHeader", for: at) as! ReferenceCollectionReusableViewHeader
        headerView.headerLabel.text = sectionHeaders[at.section]
        headerView.headerLabel.font = designValues.sectionLabelFont
        headerView.backgroundColor = designValues.backgroundColor
        headerView.addSubview(headerView.headerLabel)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ReferenceCell
        performSegue(withIdentifier: "openRef", sender: cell);
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openRef" {
            let cell = sender as! ReferenceCell
            let openVC:OpenReferenceViewController = segue.destination as! OpenReferenceViewController
            print("cell refLab", cell.ReferenceLabel.text)
//            print("openVC refLab", openVC.ReferenceLabel.text) // initialize ReferenceLabel?
//            let indexPath = self.initialCollectionView.indexPathsForSelectedItems
            openVC.ReferenceLabel = cell.ReferenceLabel //"boot"//cell.ReferenceLabel.text
        }
    }
    
}




