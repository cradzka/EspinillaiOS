//
//  checkPOST.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 5/3/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import Foundation

class checkPOST {
    let login_url = "https://httpbin.org/post"
    var login_session:String = ""
    
    func sendPOST(username:String, password:String) -> Bool {
        let username = username
        let password = password
        var success: Bool = true
        
        let post_data: NSDictionary = NSMutableDictionary()
        
        // Set post values
        post_data.setValue(username, forKey: "username")
        post_data.setValue(password, forKey: "password")
        
        let _ : NSData = NSKeyedArchiver.archivedData(withRootObject: post_data) as NSData
        let jsonData = try? JSONSerialization.data(withJSONObject: post_data)
        let url = URL(string: "https://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        // create and send post request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                success = false
                return
            }
            
            // JSON Serializaiton
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            
            // Start grabbing server response
            if let responseJSON = responseJSON as? [String: Any] {
                
                // Get user session
                if let data_block = responseJSON["data"] as? NSDictionary
                {
                    if let session_data = data_block["session"] as? String
                    {
                        self.login_session = session_data
                        
                        let preferences = UserDefaults.standard
                        preferences.set(session_data, forKey: "session")
                        
                        print("Stored Session");
                        
                        //DispatchQueue.main.async(execute: self.LoginDone)
                    }
                }
                //Test response
                print("POST Successful")
                print(responseJSON)
            }
        }
        
        task.resume()
        return success
    }

}
