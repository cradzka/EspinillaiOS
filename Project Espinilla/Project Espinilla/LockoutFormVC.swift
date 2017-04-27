//
//  LockoutFormVC.swift
//  Project Espinilla
//
//  Created by Raj Singh on 4/25/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit

class LockoutFormVC: UIViewController {


    
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var ResidentName: UILabel!
    @IBOutlet weak var ResidentNameField: UITextField!
    @IBOutlet weak var HallName: UILabel!
    @IBOutlet weak var HallNameField: UITextField!
    @IBOutlet weak var RoomNumber: UILabel!
    @IBOutlet weak var RoomNumberField: UITextField!
    @IBOutlet weak var IDMethodName: UILabel!
    @IBOutlet weak var IDMethod: UIPickerView!
    @IBOutlet weak var StudentSignatureBox: YPDrawSignatureView!
    @IBOutlet weak var StudentSignature: UILabel!
    @IBOutlet weak var ClearButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any) {
        StudentSignatureBox.clear()
    }
    
//    @IBAction func getSig(_ sender: Any) -> UIImage {
//        let img = StudentSignatureBox.getSignature()
//        return img!
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.Date.text = "05/02/2017"
        self.ResidentNameField.text = "Yung Raj Macgyver"
        self.HallNameField.text = "Torres"
        self.RoomNumberField.text = "113"
    }

    func sendForm(){
        
        let dict = NSMutableDictionary()
        var img: UIImage!
        
        //formbase fields
        dict["author"] = "Carter"
        dict["hall"] = self.HallName.text
        dict["room_number"] = self.RoomNumber.text
        dict["id"] = arc4random()
        dict["date"] = self.Date.text;
        
        //room entry request form fields
        dict["student"] = self.ResidentName.text
        //returns a data object with the jpeg representation
        dict["student_sig"] = UIImageJPEGRepresentation(self.StudentSignatureBox.getSignature()!, 1.0)
        
        
    }
    
    
    
}
