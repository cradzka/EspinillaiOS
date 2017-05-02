//
//  NavBarVC.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 5/2/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class NavBarVC: UINavigationController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.isTranslucent = false
        navBar.barTintColor = UIColor(colorLiteralRed: 0.038, green: 0.520, blue: 1.0, alpha: 1.0)
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
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
