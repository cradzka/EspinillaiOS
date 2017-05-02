//
//  AccountTableVC.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 4/22/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//
// Some table view code was used from:
// https://www.weheartswift.com/how-to-make-a-simple-table-view-with-ios-8-and-swift/

import UIKit

class AccountTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutPress() {
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: "session")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier:"LoginVC")
        self.present(controller, animated: true, completion: nil)
    }
    
}
