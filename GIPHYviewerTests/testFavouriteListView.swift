//
//  testFavouriteListView.swift
//  GIPHYviewerTests
//
//  Created by Kevin Kan on 20/2/2021.
//

import XCTest
@testable import GIPHYviewer

class testFavouriteListView: XCTestCase {

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
    
    func testdelete_FavouriteListView(){
        //Create A GIFItem
        let testOriginal = Original(url: URL(string: "www.google.com")!)
        let testGIFImage = GIFImage(original: testOriginal)
        let testGIFItem = GIFItem(type: "test1", id: "test2", url: "test3", embed_url: "test4", title: "test5", rating: "test6", images: testGIFImage)
        
        let testFavouriteList = FavouriteList()
        testFavouriteList.favlist.append(testGIFItem)
        testFavouriteList.idlist.append("www.google.com")
        let testFavouriteListView = FavouriteListView(favouriteList: testFavouriteList)
        
        XCTAssertTrue(!testFavouriteList.favlist.isEmpty)
        XCTAssertTrue(!testFavouriteList.idlist.isEmpty)
        
        let array = [0]
        let indexSet = IndexSet(array)
        
        testFavouriteListView.delete(at: indexSet)
        
        XCTAssertTrue(testFavouriteList.favlist.isEmpty)
        XCTAssertTrue(testFavouriteList.idlist.isEmpty)
    }

}
