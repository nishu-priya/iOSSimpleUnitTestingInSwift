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
        XCTAssert(vc.resultLabel.text == "40.0", "resultLabel doesn't show the right text")    }

    
    
    func testAsynchronousURLConnection() {
        let URL = NSURL(string: "https://www.google.co.in/")!
        let expectation = expectationWithDescription("GET \(URL)")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(URL) { data, response, error in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as? NSHTTPURLResponse,
                responseURL = HTTPResponse.URL,
                MIMEType = HTTPResponse.MIMEType
            {
                XCTAssertEqual(responseURL.absoluteString, URL.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
                XCTAssertEqual(MIMEType, "text/html", "HTTP response content type should be text/html")
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            expectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectationsWithTimeout(task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
    
    
}
