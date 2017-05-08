//
//  BaseViewTest.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 5/3/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import Foundation
import UIKit

class BaseViewTest: UIViewController {
    
    var controller : String = ""
    
    func slideMenuItemSelectedAtIndex(index: Int32) -> String {
        //let topViewController : UIViewController = self.navigationController!.topViewController!
        //print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Welcome!\n", terminator: "")
            self.controller = ""
            return controller
        case 1:
            print("DutySchedule\n", terminator: "")
            self.controller = "DutyScheduleVC"
            return controller
        case 2:
            print("Settings\n", terminator: "")
            self.controller = "SettingsVC"
            return controller
        case 3:
            print("Account\n", terminator: "")
            self.controller = "AccountVC"
            return controller
        default:
            self.controller = ""
            return controller
        }
    }
    
    func addSlideMenuButton() -> UIButton{
        let btnShowMenu = UIButton(type: UIButtonType.system)
        //btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        btnShowMenu.tintColor = UIColor.white
        
        return btnShowMenu
        //self.navigationItem.leftBarButtonItem = customBarItem;
    }


}
