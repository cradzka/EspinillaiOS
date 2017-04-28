//
//  TopBarVC.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 4/22/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class TopBarVC: BaseViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
        
        searchBar.showsCancelButton = false
        searchBar.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
