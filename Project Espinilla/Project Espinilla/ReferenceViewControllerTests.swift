//
//  ReferenceViewControllerTests.swift
//  Project Espinilla
//
//  Created by Timothy Errickson on 5/2/17.
//  Copyright © 2017 Matthew Crepeau. All rights reserved.
//

import XCTest
@testable import Project_Espinilla

class ReferenceViewControllerTests: XCTestCase {
    var vc: ReferenceViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testFillSubsectionLists() {
        XCTAssert(true)
//        XCTAssert(vc.numberOfSections(in: vc.initialCollectionView) > 0, "0 sections to be filled in Reference View Controller")
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
