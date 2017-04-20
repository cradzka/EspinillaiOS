//
//  WindowVC.swift
//  Project Espinilla
//
//  Created by Raj Singh on 4/18/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class WindowVC: UIViewController {

    @IBOutlet weak var datLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datLabel.textColor = UIColor.red
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
}
