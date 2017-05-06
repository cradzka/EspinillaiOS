//
//  OpenReferenceViewControllerTests.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 5/2/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//
protocol OpenReferenceViewControllerInput
{
    //precondition:
    //reference cell is selected
}
protocol OpenReferenceViewControllerOutput
{
    //postcondition:
    //always true: open reference view controller displays
}
import XCTest
@testable import Project_Espinilla

class OpenReferenceViewControllerTests: XCTestCase {
    var vc: OpenReferenceViewController!
    
    override func setUp() {
        // super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let bundle = Bundle(for: OpenReferenceViewController.self)
        let storyboard = UIStoryboard(name: "References", bundle: bundle)
        vc = storyboard.instantiateViewController(withIdentifier: "OpenReferenceViewController") as! OpenReferenceViewController
        
        _ = vc.view
    }
    
    func testVars() {
        XCTAssert(vc.ReferenceLabel != nil, "ReferenceLabel is nil")
        XCTAssert(vc.dosText != nil, "dosText is nil")
        XCTAssert(vc.dontsText != nil, "dontsText is nil")
        XCTAssert(vc.contentText != nil, "contentText is nil")
        print("all vars in OpenReferenceViewController are initialized")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
