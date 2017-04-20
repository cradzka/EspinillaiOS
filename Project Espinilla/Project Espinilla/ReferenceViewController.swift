//
//  SecondViewController.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 2/22/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class ReferenceViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //@IBOutlet weak var RefLabel: UILabel!
    //@IBOutlet weak var RefDescr: UILabel!
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
    var rulesAndRegulationsNames: Array<String> = ["Other", "Kristina", "Tim"]
    
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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ReferenceViewController.didTap(sender:)))
        
        initialCollectionView.isUserInteractionEnabled = true
        initialCollectionView.addGestureRecognizer(tapGestureRecognizer)
        
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
    
    /* This function is called when the button is tapped (touch up inside sent event) */
    
    func didTap(sender: UITapGestureRecognizer) {
        _ = sender.location(in: view)
        self.openViewControllerBasedOnIdentifier("OpenReferenceViewController")
        print("yo")
        // User tapped at the point above. Do something with that if you want.
    }
    
    override func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        /* Get the destination view controller (e.g. the controller to be opened by the button */
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        /* Get the current top view controller */
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC") // You clicked a button that takes you to the view you are currently on
        } else {
            /* Push the new view onto the navigation stack */
            self.navigationController!.pushViewController(destViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return self.subsectionList.count
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
    
}




