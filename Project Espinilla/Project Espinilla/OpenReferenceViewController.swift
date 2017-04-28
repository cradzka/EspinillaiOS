//
//  WindowVC.swift
//  Sample Window Opener
//
//  Created by Matthew Crepeau on 4/5/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//
import UIKit

class OpenReferenceViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var ReferenceLabel: UILabel!
    
    @IBOutlet weak var dosText: UITextView!
    
    @IBOutlet weak var dontsText: UITextView!
    
    @IBOutlet weak var contentText: UITextView!
    
    var ref: Reference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ReferenceLabel.text = ref?.name
        
        dosText.delegate = self
        dontsText.delegate = self
        contentText.delegate = self
        
        self.dosText.text = "Dos: \n"
        self.dontsText.text = "Dont's: \n"
        self.contentText.text = "Content: Blah Blah \n"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
