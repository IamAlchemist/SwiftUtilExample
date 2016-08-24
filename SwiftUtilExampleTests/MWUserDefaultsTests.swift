//
//  MWUserDefaultsTests.swift
//  SwiftUtilExample
//
//  Created by wizard lee on 8/24/16.
//  Copyright © 2016 wizard lee. All rights reserved.
//

import XCTest

class MWUserDefaultsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArray() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let value = MWUserDefaultsValue(key: "stringArray")
        let strings = ["hello","world"]
        value.save(strings)
        
        let strs = value.array
        XCTAssertNotNil(strs)
        
        let mystrings = strs as? [String]
        XCTAssertNotNil(mystrings)
        
        XCTAssertEqual(mystrings!.count, 2)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
