//
//  OpenReferenceViewController.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 4/11/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class OpenReferenceViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transition(sender: ReferenceCell!, openWindow: UIViewController) {
        self.present(openWindow, animated: true, completion: nil)
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
