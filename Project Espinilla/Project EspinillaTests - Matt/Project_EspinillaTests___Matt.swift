//
//  Project_EspinillaTests___Matt.swift
//  Project EspinillaTests - Matt
//
//  Created by Matthew Crepeau on 5/3/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//
// Some networking unit test code taken from:
// http://nshipster.com/xctestcase/

import XCTest
@testable import Project_Espinilla

class Project_EspinillaTests___Matt: XCTestCase {
    //var POSTtest: checkPOST!
    
    override func setUp() {
        super.setUp()
        //POSTtest = checkPOST()
        //POSTtest.sendPOST("Matthew", "Password")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //POSTtest = nil
        super.tearDown()
    }
    
    func testVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let initialController = storyboard.instantiateInitialViewController()!
        
        // Test and Load the View at the Same Time!
        XCTAssertNotNil(initialController.view)
    }
    
    func testBaseVC() {
        let base = BaseViewTest()
        
        // Test the funciton to open view controllers
        XCTAssertEqual(base.slideMenuItemSelectedAtIndex(index: 0), "", "Incorrect Return")
        XCTAssertEqual(base.slideMenuItemSelectedAtIndex(index: 1), "DutyScheduleVC", "Incorrect Return")
        XCTAssertEqual(base.slideMenuItemSelectedAtIndex(index: 2), "SettingsVC", "Incorrect Return")
        XCTAssertEqual(base.slideMenuItemSelectedAtIndex(index: 3), "AccountVC", "Incorrect Return")
        XCTAssertEqual(base.slideMenuItemSelectedAtIndex(index: 4), "", "Incorrect Return")
        
        // Test the function to draw a menu button
        XCTAssertEqual(base.addSlideMenuButton().tintColor, UIColor.white, "Color should be white")
        XCTAssertEqual(base.addSlideMenuButton().frame.width, 30, "Frame width should be 30")
        XCTAssertEqual(base.addSlideMenuButton().frame.height, 30, "Frame height should be 30")

    }
    
    func testNetworkPOST() {
        // This function checks to make sure POST requests can be sent from the app.
        let posttest = checkPOST()
        XCTAssertEqual(posttest.sendPOST(username: "matthew", password: "password"), true, "POST request failed.")
    }
    
    func testAsynchronousURLConnection() {
        // The server URL
        let url = URL(string: "http://35.161.216.206:8000/api/submitlockoutform/")!
        // We expect a GET request (it should be unauthorized since we aren't using a valid auth token
        let urlExpectation = expectation(description: "GET \(url)")
        
        // Set up the session
        let session = URLSession.shared
        // Set up an async task
        let task = session.dataTask(with: url) { (data, response, error) in
            // Fail if no response
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let response = response as? HTTPURLResponse,
                let responseURL = response.url,
                let mimeType = response.mimeType
            {
                // Check for good URL, unauthorized response, and we're expecting a JSON object
                XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(response.statusCode, 401, "HTTP response status code should be 401")
                XCTAssertEqual(mimeType, "application/json", "HTTP response content type should be application/json")
            } else {
                XCTFail("Response was not NSHTTPURLResponse") // Shouldn't happen
            }
            
            urlExpectation.fulfill()
        }
        
        task.resume()
        
        // Wait for the task to finish
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
