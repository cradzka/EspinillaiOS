//
//  LockoutFormVC.swift
//  Project Espinilla
//
//  Created by Raj Singh on 4/25/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit
import AVFoundation

class LockoutFormVC: UIViewController {

    
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var ResidentName: UILabel!
    @IBOutlet weak var ResidentNameField: UITextField!
    @IBOutlet weak var HallName: UILabel!
    @IBOutlet weak var HallNameField: UITextField!
    @IBOutlet weak var RoomNumber: UILabel!
    @IBOutlet weak var RoomNumberField: UITextField!
    @IBOutlet weak var IDMethodName: UILabel!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var VerificationMethod: UITextField!
    @IBOutlet weak var StudentSignatureBox: YPDrawSignatureView!
    @IBOutlet weak var StudentSignature: UILabel!
    @IBOutlet weak var ClearButton: UIButton!
    var img = NSData.init()
    var designValues = UIDesignValue.init()

    
    func segueBack(action: UIAlertAction) {
        self.openViewControllerBasedOnIdentifier("initialForms")
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        StudentSignatureBox.clear()
    }
    
    @IBAction func getSig(_ sender: Any) {
        print("Howdy")
        self.img =  UIImageJPEGRepresentation(self.StudentSignatureBox.getSignature()!, 1.0)! as NSData
        print("\(type(of: self.img))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.HallNameField.text = "Torres"
        self.HallName.font = designValues.labelFont
        self.ResidentName.font = designValues.labelFont
        self.RoomNumber.font = designValues.labelFont
        self.IDMethodName.font = designValues.labelFont
        self.StudentSignature.font = designValues.labelFont
        self.RoomNumberField.text = "113"
        self.ResidentNameField.text = "Raj"
        //self.Date.text = "2017-05-02"
        self.VerificationMethod.text = "Student ID"
        self.view.layer.backgroundColor = designValues.backgroundColor.cgColor
        
    }

    @IBAction func sendForm(_ sender: Any) {
        let dict = NSMutableDictionary()
        getSig((Any).self)
        //var img: NSData!
        //formbase fields
        dict["author"] = "Carter Radzka"
        dict["hall"] = self.HallName.text
        dict["room_number"] = self.RoomNumber.text
        //dict["id"] = arc4random()
        //dict["date"] = self.Date.text;
        
        //room entry request form fields
        dict["student"] = self.ResidentName.text
        
        
        //img =  UIImageJPEGRepresentation(self.StudentSignatureBox.getSignature()!, 1.0)! as NSData

        //returns a data object with the jpeg representation
        
        //fucking lmao
        dict["student_sig"] = self.img.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
        dict["verification_method"] = self.VerificationMethod.text

        //let _ : NSData = NSKeyedArchiver.archivedData(withRootObject: dict) as NSData
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dict)
        let url = URL(string: "https://httpbin.org/post")!
        //let url = URL(string: "https://34.209.25.21:8000/api/submitlockoutform/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        // create post request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print("HOLY FUCK")
                print(responseJSON)
            }
        }
        
        task.resume()
        let alert = UIAlertController(title: "Success!", message: "Form submitted!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.cancel, handler: segueBack))
        self.present(alert, animated: true, completion: nil)
        
        
    
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        /* Get the destination view controller (e.g. the controller to be opened by the button */
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        /* Get the current top view controller */
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC") // You clicked a button that takes you to the view you are currently on
        } else {
            /* Push the new view onto the navigation stack */
            self.navigationController!.pushViewController(destViewController, animated: true)
        }
    }
    
   
}
