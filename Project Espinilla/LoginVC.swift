//
//  LoginVC.swift
//  Project Espinilla
//
//  Created by Matthew Crepeau on 4/18/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    let login_url = "https://httpbin.org/post"
    let checksession_url = "https://httpbin.org/post"
    
    @IBOutlet var username_input: UITextField!
    @IBOutlet var password_input: UITextField!
    @IBOutlet var login_button: UIButton!
    
    var login_session:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = UserDefaults.standard // Contains the session info
        
        // Check if the user is logged in
        if preferences.object(forKey: "session") != nil
        {
            login_session = preferences.object(forKey: "session") as! String
            check_session()
            //TODO: Open view controller
        }
        else
        {
            LoginToDo()
        }
        
        // Show TouchID if available
        // 1. Create a authentication context
        let authenticationContext = LAContext()
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            
            return
            
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Scan your finger to log in",
            reply: { [unowned self] (success, error) -> Void in
                
                if( success ) {
                    
                    // Fingerprint recognized
                    // Go to view controller
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier:"TopBarNC")
                    self.present(controller, animated: true, completion: nil)
                    
                }else {
                    
                    // Check if there is an error
                    if error != nil {
                        print("error")
                        //let message = self.errorMessageForLAErrorCode(error.code)
                        //self.showAlertViewAfterEvaluatingPolicyWithMessage(message)
                    }
                }
                
        })
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    @IBAction func onLoginPress() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier:"TopBarNC")
        self.present(controller, animated: true, completion: nil)
 
    }
    */
    
    @IBAction func onLoginPress() {
        
        let username = username_input.text!
        let password = password_input.text!
        
        print(username)
        print(password)
        
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
                print("HOLY FUCK")
                print(responseJSON)
                DispatchQueue.main.async(execute: self.LoginDone)
            }
        }
        
        task.resume()
        
    }
    
    func LoginDone()
    {
        // Launch the home VC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier:"TopBarNC")
        self.present(controller, animated: true, completion: nil)
        
        // Set User data?
    }
    
    func LoginToDo()
    {
        //Set up login screen
    }
    
    func check_session() {
        
        let post_data: NSDictionary = NSMutableDictionary()
        
        post_data.setValue(login_session, forKey: "session")
        
        let url:URL = URL(string: checksession_url)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        var paramString = ""
        
        // Create parameter string for POST
        for (key, value) in post_data
        {
            paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
        }
        
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                
                return
            }
            
            let json: Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            if let response_code = server_response["response_code"] as? Int
            {
                if(response_code == 200)
                {
                    DispatchQueue.main.async(execute: self.LoginDone)
                }
                else
                {
                    DispatchQueue.main.async(execute: self.LoginToDo)
                }
            }
            
        })
        
        task.resume()
        
    }

}
