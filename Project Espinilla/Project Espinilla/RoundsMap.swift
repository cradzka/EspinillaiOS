//
//  RoundsMap.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/29/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class RoundsMap: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var roundsImage: UIImageView!
    
    var  issueTapRecognizer: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roundsImage.image = #imageLiteral(resourceName: "roundsMapBefore")
        self.view.backgroundColor = UIColor.lightGray
        self.issueTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        self.roundsImage.addGestureRecognizer(self.issueTapRecognizer!)
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "roundsMapPopover", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if(segue.identifier == "roundsMapPopover") {
            if let roundsIssueVC = segue.destination as? RoundsMapIssue {
                
                roundsIssueVC.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
                roundsIssueVC.popoverPresentationController?.delegate = self
                roundsIssueVC.popoverPresentationController?.sourceView = self.roundsImage
                roundsIssueVC.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: 0, width: 100, height: 100)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
