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

    var conflictResolutionNames: Array<String> = ["Roommate Conflicts", "Noise Complaints", "Party Busting", "Confrontation"]
    var doCR: Array<String> = ["Stay calm\nMeet in a public place", "Stay calm", "Stay calm\nCall Campus Police", "Stay calm"]
    var dontCR: Array<String> = ["Yell\nPick sides", "Yell\nOverreact", "Drink the confescated alcohol\nLet the criminals run", ""]
    var crisisPreventionNames: Array<String> = ["Suicidal Resident", "Medical Emergency", "Academic Crisis"]
    var doCP: Array<String> = ["Stay calm\nContact Emergency Response people as needed", "What's the number for 911?", "Cry"]
    var dontCP: Array<String> = ["Make jokes", "Try to be a doctor", "Turn in your late assignments"]
    var rulesAndRegulationsNames: Array<String> = ["Rules and Regulations"]
    var doRR: Array<String> = [""]
    var dontRR: Array<String> = [""]
    var refNames: [Reference] = []
    
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
        
        for (i,names) in conflictResolution.enumerated() {
            refNames.append(Reference.init(name: names, dosText: doCR[i], dontsText: dontCR[i], contentText: ""))
        }
        for (i,names) in crisisPrevention.enumerated() {
            refNames.append(Reference.init(name: names, dosText: doCP[i], dontsText: dontCP[i], contentText: ""))
        }
        for (i,names) in rulesRegulations.enumerated() {
            refNames.append(Reference.init(name: names, dosText: doRR[i], dontsText: dontRR[i], contentText: ""))
        }
        
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
        
        if (cell.ReferenceLabel.text == "Roommate Conflicts") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "roommateConflict")
        } else if (cell.ReferenceLabel.text == "Noise Complaints") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "noiseComplaints")
        } else if (cell.ReferenceLabel.text == "Party Busting") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "partyBusting")
        } else if (cell.ReferenceLabel.text == "Academic Crisis") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "academicCrisis")
        } else if (cell.ReferenceLabel.text == "Confrontation") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "confrontation")
        } else if (cell.ReferenceLabel.text == "Suicidal Resident") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "suicidalResident")
        } else if (cell.ReferenceLabel.text == "Medical Emergency") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "medicalEmergency")
        } else if (sectionName == "Rules and Regulations") {
            cell.ReferenceImageView.image = #imageLiteral(resourceName: "rulesAndRegulations")
        }
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
            let openVC: OpenReferenceViewController = segue.destination as! OpenReferenceViewController
            let findCell = Reference.init(name: cell.ReferenceLabel.text!, dosText: "", dontsText: "", contentText: "")
            let indexPath = refNames.index{$0.name == findCell.name}
            let ref = refNames[indexPath!]
            openVC.ref = ref
        }
    }
    
}
