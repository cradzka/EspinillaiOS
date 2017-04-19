//
//  RA.swift
//  Project Espinilla
//
//  Created by Carter Radzka on 4/10/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import Foundation

class RA {
    var authToken: Int //auth token gaine after logging in
    var userName: String //username from login
    var fname: String //RA first name
    var lname: String //RA last name
    var area: String //area in which RA manages
    var buildingList: Array<String> //list of buildings in area
    var notificationList: Array<String> //list of notifications
    var onDuty: Int //0 = No, 1 = Yes, 2 = Within next 17 hours (12:00am - 5:00pm)
    var formLists: [String: Array<String>] //form lists indexed by catagory
    var issueLists:[String: Array<String>] //issue lists indexed by building
    
    //Only called upon successful login
    init(authToken: Int,
         userName: String,
         fname: String,
         lname: String,
         area: String,
         buildingList: Array<String>,
         notificationList: Array<String>,
         onDuty: Int,
         formLists: [String: Array<String>],
         issueLists: [String: Array<String>])
    {
        self.authToken = authToken
        self.userName = userName
        self.fname = fname
        self.lname = lname
        self.area = area
        self.buildingList = buildingList
        self.notificationList = notificationList
        self.onDuty = onDuty
        self.formLists = formLists
        self.issueLists = issueLists
    }
    
    //Fetches new auth token when VALID user session auth token expires.
    func refreshAuthToken() {
        //TODO
    }
    
    //Fetches RA info including fname, lname, and area
    func getRAInfo() {
        //
    }
    
    //Fetches on duty status of RA and signals indicator to change if needed
    func checkIfOnDuty() {
        
    }
    
    //Fetches RA  building list based on their area
    func getRABuildingList() {
        
    }
    
    //Fetches RA notification list
    func getRANotificationList() {
        
    }
    
    //Fetches RA lists of forms
    func getRAFormLists() {
        
    }
    
    //Fetches RA lists of issues
    func getRAIssueLists() {
        
    }
    
    
    
    /*
     var userName: String {
     set { _userName = newUserName}
     get { return _userName}
     }
     
     //TODO: Replace set with username fetching logic
     var name: String {
     set { _name = newName}
     get { return _name}
     }
     var area: String{
     set {_area = newArea}
     get {return _area}
     }
     var buildingList: Array<String> {
     set {_buildingList = newBuildingList}
     get {return _buildingList}
     }
     var notificationList: Array<String> {
     set {_notificationList = newNotificationList}
     get {return _notificationList}
     }
     //TODO: Might need to signal baseview duty indicator
     //Only need to check once per day or when OnDuty notification recieved from DB
     var onDuty: Int {
     set { _onDute = newOnDuty}
     get {return _onDuty}
     }
     
     //TODO: Functionality to add subsets of forms to list so we don't download entire list every time we set it
     var formLists: [String: Array<String>]{
     set {_formLists = newformLists}
     get {return _formLists}
     }
     
     //TODO: Same as form list.
     var issueLists:[String: Array<String>]{
     set {_issueLists = newissueLists}
     get {return _issueLists}
     }
     */
    
}
