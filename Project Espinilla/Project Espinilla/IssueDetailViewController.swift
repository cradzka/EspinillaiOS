//
//  IssueDetailViewController.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/24/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController{

    @IBOutlet var baseView: UIView!
    @IBOutlet weak var issueTitle: UILabel!
    @IBOutlet weak var issueScrollView: UIScrollView!
    @IBOutlet weak var metaInfo: UILabel!
    @IBOutlet weak var issueText: UITextView!
    @IBOutlet weak var nodeZonePath: UILabel!
    @IBOutlet weak var zoneImage: UIImageView!
    @IBOutlet weak var extraImage: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    var issue: Issue?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.issueText.text = issue?.bodyText
        self.metaInfo.text = (issue?.author)! + " " + (issue?.date)!
        self.nodeZonePath.text = issue?.location
        self.zoneImage.image = #imageLiteral(resourceName: "mapPlaceHolder")
        self.imageLabel.text = "Additional Images"
        self.extraImage.image = #imageLiteral(resourceName: "sleepingStudent")
        
        self.issueScrollView.addSubview(self.issueText)
        self.issueScrollView.addSubview(self.metaInfo)
        self.issueScrollView.addSubview(self.nodeZonePath)
        self.issueScrollView.addSubview(self.zoneImage)
        self.issueScrollView.addSubview(self.imageLabel)
        self.issueScrollView.addSubview(self.extraImage)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
