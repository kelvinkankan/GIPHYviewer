//
//  GIFItemtest.swift
//  GIFHYviewerTests
//
//  Created by Kevin Kan on 20/2/2021.
//

import XCTest
@testable import GIPHYviewer

class GIFItemtest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInit_Original() {
        let testOriginal = Original(url: URL(string: "www.google.com")!)
        XCTAssertNotNil(testOriginal)
        XCTAssertEqual(testOriginal.url, URL(string: "www.google.com"))
    }
    
    func testInit_GIFImage(){
        let testOriginal = Original(url: URL(string: "www.google.com")!)
        let testGIFImage = GIFImage(original: testOriginal)
        XCTAssertNotNil(testGIFImage)
        XCTAssertEqual(testGIFImage.original.url, URL(string: "www.google.com"))
    }
    func testInit_GIFItem(){
        let testOriginal = Original(url: URL(string: "www.google.com")!)
        let testGIFImage = GIFImage(original: testOriginal)
        let testGIFItem = GIFItem(type: "test1", id: "test2", url: "test3", embed_url: "test4", title: "test5", rating: "test6", images: testGIFImage)
        XCTAssertNotNil(testGIFItem)
        XCTAssertEqual(testGIFItem.type, "test1")
        XCTAssertEqual(testGIFItem.id, "test2")
        XCTAssertEqual(testGIFItem.url, "test3")
        XCTAssertEqual(testGIFItem.embed_url, "test4")
        XCTAssertEqual(testGIFItem.title, "test5")
        XCTAssertEqual(testGIFItem.rating, "test6")
        XCTAssertEqual(testGIFItem.images, testGIFImage)
    }

}
