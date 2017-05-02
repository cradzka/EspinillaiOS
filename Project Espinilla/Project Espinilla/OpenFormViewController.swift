//
////
////  FirstViewController.swift
////  Project Espinilla
////
////  Created by Matthew Crepeau on 2/22/17.
////  Copyright © 2017 Matthew Crepeau. All rights reserved.
////
//
//import UIKit
//
//class OpenFormViewController: BaseViewController {
//    
//    
//    
//    @IBOutlet weak var MainCollectionView: UICollectionView!
//    
//    @IBOutlet weak var MainCollectionViewLayout: UICollectionViewFlowLayout!
//    //@IBOutlet weak var SlideOut: UIImageView!
//    
//    //let tapRec = UITapGestureRecognizer()
//    
////    var formNames = ["Housing Survey", "Lockout Form", "Violation Form"]
////    var fieldsLeft = ["10 Fields Remaining", "12 Fields Remaining", "5 Fields Remaining"]
////    var halls = ["Driscoll", "Torres", "Baca"]
////    var RAs = ["Carter", "Raj", "Kristina"]
////    var sectionHeaders: Array<String> = ["In Progress", "Completed"]
//    var designValues = UIDesignValue.init()
//    var dataAndDelegate: OpenFormViewDataAndDelegate!
//    
//    //var presentationStyle = UIModalPresentationStyle.overCurrentContext
//    //var transitionStyle = UIModalTransitionStyle.coverVertical
//    //var tempWindowVC: OpenFormView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.addSlideMenuButton()
//        
//        MainCollectionView.backgroundColor = designValues.backgroundColor
//        MainCollectionView.register(UINib(nibName: "SectionDivider", bundle: nil), forCellWithReuseIdentifier: "SectionDivider")
//        
//        MainCollectionView.register(UINib(nibName: "GeneralInfo", bundle: nil), forCellWithReuseIdentifier: "GeneralInfo")
//        
//        //MainCollectionView.register(UINib(nibName: "FormHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeader")
//        
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        dataAndDelegate = OpenFormViewDataAndDelegate(collectionLayout: MainCollectionViewLayout)
//        
//        MainCollectionView.dataSource = dataAndDelegate
//        MainCollectionView.delegate = dataAndDelegate
//        
//        MainCollectionView.isScrollEnabled = true
//        MainCollectionView.isUserInteractionEnabled = true
//        MainCollectionView.bounces = true
//        MainCollectionView.alwaysBounceVertical = true
//        
//        MainCollectionViewLayout.minimumLineSpacing = designValues.spaceBetweenLines
//        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FormViewController.didTap(sender:)))
//        
//        MainCollectionView.isUserInteractionEnabled = true
//        MainCollectionView.addGestureRecognizer(tapGestureRecognizer)
//        
//        
//        //        tempWindowVC = WindowVC()
//        //        self.present(tempWindowVC, animated: true, completion: nil)
//        
//        //tapRec.addTarget(self, action: #selector(FormViewController.tappedView))
//        //SlideOut.addGestureRecognizer(tapRec)
//        
//    }
//    
//    
//    /* This function is called when the button is tapped (touch up inside sent event) */
//    
//    func didTap(sender: UITapGestureRecognizer) {
//        _ = sender.location(in: view)
//        self.openViewControllerBasedOnIdentifier("openFormVC")
//        print("yo")
//        // User tapped at the point above. Do something with that if you want.
//    }
//    
//    override func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
//        /* Get the destination view controller (e.g. the controller to be opened by the button */
//        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
//        
//        /* Get the current top view controller */
//        let topViewController : UIViewController = self.navigationController!.topViewController!
//        
//        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
//            print("Same VC") // You clicked a button that takes you to the view you are currently on
//        } else {
//            /* Push the new view onto the navigation stack */
//            self.navigationController!.pushViewController(destViewController, animated: true)
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    @IBAction func doPresent(_ sender: Any?) {
//        //let svc = OpenFormView()
//        //self.present(svc, animated:true)
//    }
//    
//    override func present(_ viewControllerToPresent: UIViewController,
//                          animated flag: Bool,
//                          completion: (() -> Void)? = nil) {
//        
//        print("presenting")
//        
//    }
//    
//    
//}
//
