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
    
    @IBOutlet weak var VerificationMethod: UITextField!
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

    @IBAction func sendForm(_ sender: Any) {
        let dict = NSMutableDictionary()
        //var img: NSData!
        //formbase fields
        dict["author"] = "Carter"
        dict["hall"] = self.HallName.text
        dict["room_number"] = self.RoomNumber.text
        dict["id"] = arc4random()
        dict["date"] = self.Date.text;
        
        //room entry request form fields
        dict["student"] = self.ResidentName.text
        
        
//        img =  UIImageJPEGRepresentation(self.StudentSignatureBox.getSignature()!, 1.0)! as NSData

        //returns a data object with the jpeg representation
        
        //dict["student_sig"] = img
        
        dict["verification_method"] = self.VerificationMethod.text
        
        //
        //        do {
        //            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        //            // here "jsonData" is the dictionary encoded in JSON data
        //
        //            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
        //            // here "decoded" is of type `Any`, decoded from JSON data
        //
        //            // you can now cast it with the right type
        //            if let dictFromJSON = decoded as? [String:String] {
        //                // use dictFromJSON
        //            }
        //        } catch {
        //            print(error.localizedDescription)
        //        }
        //        let dictionary = ["aKey": "aValue", "anotherKey": "anotherValue"]
        
        //        if let jsonData = try? JSONSerialization.data(
        //            withJSONObject: dict,
        //            options: []) {
        //            let theJSONText = String(data: jsonData,
        //                                     encoding: .ascii)
        //
        //            print("JSON string = \(theJSONText!)")
        //            //if the dict was dictionary, it outputs "JSON string = {"anotherKey":"anotherValue","aKey":"aValue"}".. backwards?
        //        }
        //
        
        let _ : NSData = NSKeyedArchiver.archivedData(withRootObject: dict) as NSData
        let jsonData = try? JSONSerialization.data(withJSONObject: dict)
        let url = URL(string: "https://httpbin.org/post")!
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
    
    }
}
