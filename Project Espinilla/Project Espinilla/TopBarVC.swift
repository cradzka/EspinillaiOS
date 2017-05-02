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
        self.searchBar.layer.borderWidth = 0
        self.searchBar.showsCancelButton = true
        self.searchBar.delegate = self
        
        let cancelButtonAttributes: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes as? [String : AnyObject], for: UIControlState.normal)

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //This is where I would do search stuff if it wasn't so freaking retarded
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.searchBar.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
