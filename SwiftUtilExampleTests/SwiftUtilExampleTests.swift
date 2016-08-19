//
//  SwiftUtilExampleTests.swift
//  SwiftUtilExampleTests
//
//  Created by wizard lee on 8/16/16.
//  Copyright © 2016 wizard lee. All rights reserved.
//

import XCTest
@testable import SwiftUtilExample

class SwiftUtilExampleTests: XCTestCase {
    let testDirectory = MWUtil.applicationDocumentsDirectory()!.URLByAppendingPathComponent("Test")
    var setupLogger = false
    
    override func setUp() {
        super.setUp()
        if !setupLogger {
            setupLogger = true
            MWUtil.setupCleanRoomLogger()
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testApplicationDocumentsDirectory() {
        XCTAssertNotNil(MWUtil.applicationDocumentsDirectory(), "document directory should not be empty")
    }
    
    func testDirectoryExists() {
        let documentsPath = MWUtil.applicationDocumentsDirectory()!.path!
        XCTAssertTrue(MWUtil.directoryExists(documentsPath), "can't find : \(documentsPath)")
    }
    
    func testCreateDirectory() {
        let newDirectory = testDirectory.URLByAppendingPathComponent("useless directory")
        MWUtil.createDirectory(newDirectory)
        XCTAssertTrue(MWUtil.directoryExists(newDirectory.path!), "create directory failed")
    }
    
    func testRemoveDirectory() {
        MWUtil.createDirectory(testDirectory)
        let testDirectoryPath = testDirectory.path!
        XCTAssertTrue(MWUtil.directoryExists(testDirectoryPath), "can't create folder \(testDirectoryPath)")
        
        for folderName in ["Folder1", "Folder2"] {
            let folder = testDirectory.URLByAppendingPathComponent(folderName)
            MWUtil.createDirectory(folder)
            let folderPath = folder.path!
            XCTAssertTrue(MWUtil.directoryExists(folderPath), "can't create folder \(folderPath)")
        }
        
        
        let textFile = testDirectory.URLByAppendingPathComponent("Folder2/my.txt")
        
        let text = "1\n2\n3\n"
        do {
            try text.writeToURL(textFile, atomically: true, encoding: NSUTF8StringEncoding)
        }
        catch let error as NSError {
            print("can't write file \(error.localizedDescription)")
        }
        
        XCTAssertTrue(MWUtil.directoryExists(textFile.path!), "can't find \(textFile.path!)")
        
        MWUtil.removeDirectory(testDirectory)
        
        XCTAssertFalse(MWUtil.directoryExists(testDirectory.path!), "can't remove \(testDirectory.path!)")
        
        MWUtil.removeDirectory(testDirectory)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
