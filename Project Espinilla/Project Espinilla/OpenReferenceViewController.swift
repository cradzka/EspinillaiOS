//
//  WindowVC.swift
//  Sample Window Opener
//
//  Created by Matthew Crepeau on 4/5/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//
import UIKit

class OpenReferenceViewController: UIViewController {
    
    @IBOutlet weak var ReferenceLabel: UILabel!
    
    var ref: Reference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ReferenceLabel.text = ref?.name
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
