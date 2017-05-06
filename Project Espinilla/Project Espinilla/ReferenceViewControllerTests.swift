//
//  ReferenceViewControllerTests.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 5/2/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//
protocol ReferenceViewControllerInput
{
    //precondition:
    //reference tab is selected
}
protocol ReferenceViewControllerOutput
{
    //postcondition:
    //always true: reference tab displays
}
import XCTest
@testable import Project_Espinilla

class ReferenceViewControllerTests: XCTestCase {
    var vc: ReferenceViewController!
    
    override func setUp() {
        //super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let bundle = Bundle(for: ReferenceViewController.self)
        let storyboard = UIStoryboard(name: "References", bundle: bundle)
        vc = storyboard.instantiateViewController(withIdentifier: "initialReference") as! ReferenceViewController
    
        _ = vc.view
    }
    
    func testLists() {
        vc.fillsubsectionLists(sections: ["Section 1", "Section 2"])
        XCTAssert(vc.subsectionList.count != 0, "Subsection List empty")
        print("fillsubsectionLists passes test")
    }
    
    func testVars() {
        XCTAssert(vc.initialView != nil, "initialView is nil")
        XCTAssert(vc.initialStackView != nil, "initialStackView is nil")
        XCTAssert(vc.initialCollectionView != nil, "initialCollectionView is nil")
        XCTAssert(vc.initialCollectionViewLayout != nil, "initialCollectionViewLayout is nil")
        print("all UI global variables initiated in viewDidLoad()")
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
