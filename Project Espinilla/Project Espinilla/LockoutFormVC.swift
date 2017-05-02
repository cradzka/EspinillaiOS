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

    
    @IBOutlet weak var ResidentName: UILabel!
    @IBOutlet weak var ResidentNameField: UITextField!
    @IBOutlet weak var HallName: UILabel!
    @IBOutlet weak var HallNameField: UITextField!
    @IBOutlet weak var RoomNumber: UILabel!
    @IBOutlet weak var RoomNumberField: UITextField!
    @IBOutlet weak var IDMethodName: UILabel!
    
    @IBOutlet weak var formTitle: UILabel!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var VerificationMethod: UITextField!
    @IBOutlet weak var StudentSignatureBox: YPDrawSignatureView!
    @IBOutlet weak var StudentSignature: UILabel!
    @IBOutlet weak var ClearButton: UIButton!
    
    @IBOutlet weak var submitFormButton: UIButton!
    
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
        //print("\(type(of: self.img))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.HallNameField.text = "West Hall"
        self.HallName.font = designValues.labelFont
        self.ResidentName.font = designValues.labelFont
        self.RoomNumber.font = designValues.labelFont
        self.IDMethodName.font = designValues.labelFont
        self.StudentSignature.font = designValues.labelFont
        self.RoomNumberField.text = "113"
        self.ResidentNameField.text = "Roger Smith"
        //self.Date.text = "2017-05-02"
        self.VerificationMethod.text = "Student ID"
        self.view.layer.backgroundColor = designValues.backgroundColor.cgColor
        self.ClearButton.layer.borderColor = designValues.boarderColor
        self.ClearButton.layer.borderWidth = designValues.boarderWidth
        self.ClearButton.layer.backgroundColor = designValues.baseCellColor.cgColor
        
        self.submitFormButton.layer.borderColor = designValues.boarderColor
        self.submitFormButton.layer.borderWidth = designValues.boarderWidth
        self.submitFormButton.layer.backgroundColor = designValues.baseCellColor.cgColor

        self.formTitle.font = designValues.labelFont
        
    }

    @IBAction func sendForm(_ sender: Any) {
        let dict = NSMutableDictionary()
        let dict2 = NSMutableDictionary()
        getSig((Any).self)
        //var img: NSData!
        //formbase fields
        dict["author"] = "Carter Radzka"
        dict["hall"] = self.HallNameField.text
        dict["room_number"] = self.RoomNumberField.text
        //dict["id"] = arc4random()
        //dict["date"] = self.Date.text;
        
        //room entry request form fields
        dict["student"] = self.ResidentNameField.text
        
        
        //img =  UIImageJPEGRepresentation(self.StudentSignatureBox.getSignature()!, 1.0)! as NSData

        //returns a data object with the jpeg representation
        
        //fucking lmao
        //dict["student_sig"] = self.img.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
        dict["verification_method"] = self.VerificationMethod.text

        
        //let _ : NSData = NSKeyedArchiver.archivedData(withRootObject: dict) as NSData
        
        //let jsonData = try? JSONSerialization.data(withJSONObject: dict)
        //print("\(type(of: jsonData))")
        
        
        dict2["data"] = dict
        let jsonData2 = try? JSONSerialization.data(withJSONObject: dict2)

        //let url = URL(string: "https://httpbin.org/post")!
        let url = URL(string: "http://35.161.216.206:8000/api/submitlockoutform/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Authorization" : "Token 4IVbciC5WwDTn4m9KtzL8cSA9ICK_-Z2pqS8y-X3KSw="]
        
        // insert json data to the request
        request.httpBody = jsonData2
        
        //print(String(data: jsonData2!, encoding: String.Encoding.utf8) as Any)
        
        // create post request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                //print("HOLY FUCK")
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
