//
//  PercentageCalculatorTests.swift
//  PercentageCalculatorTests
//
//  Created by Nishu Priya on 16/12/16.
//  Copyright © 2016 Nishu Priya. All rights reserved.
//

import XCTest
@testable import PercentageCalculator

class PercentageCalculatorTests: XCTestCase {
    
    var vc:ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPercentageCalculator() {
        // Should be 25
        var p = vc.percentage(50, 50)
        XCTAssert(p == 25)
        
        //Should be 18.4
        p = vc.percentage(80, 23)
        XCTAssert(p == 18.4)
        
    }
    
    func testLabelPropertiesChangedProperly() {
        let _ = vc.view
        vc.updateLabels(80.0, 50.0, 40.0)

        
        // The labels should now display 80, 50 and 40
        XCTAssert(vc.numberLabel.text == "80.0", "numberLabel doesn't show the right text")
        XCTAssert(vc.percentageLabel.text == "50.0%", "percentageLabel doesn't show the right text")
        XCTAssert(vc.resultLabel.text == "40.0", "resultLabel doesn't show the right text")
    }

    
//    func testAsynchronousPercentage() {
//        let expectation = expectationWithDescription("asynchronousTest")
//        vc.asynchronouslyFindPercentage(50, 50, completionHandler: {
//            result in
//            XCTAssert(result == 25)
//            expectation.fulfill()
//        })
//        waitForExpectationsWithTimeout(1.0, handler: nil)
//    }
    
}
