//
//  RoundsMapIssue.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 5/1/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import Foundation
import UIKit

class RoundsMapIssue: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var resolvedBox: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resolvedLabel: UILabel!
    @IBOutlet weak var commentsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
