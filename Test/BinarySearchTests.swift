//
//  BinarySearchTests.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 9/18/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class BinarySearchTests: XCTestCase {
    
    var search = [Int]()
    
    override func setUp() {
        super.setUp()
        search = (1...500).map { $0 }
    }
    
    func testEmptyArray() {
        let array = [Int]()
        let index = binarySearch(array, key: 123)
        XCTAssertNil(index)
    }
    
    func testBinarySearch() {
        for i in 1...100 {
            var array = [Int]()
            for number in 1...i {
                array.append(number)
            }
            let randomIndex = Int(arc4random_uniform(UInt32(i)))
            let testValue = array[randomIndex]
            
            let index = binarySearch(array, key: testValue)
            XCTAssertNotNil(index)
            XCTAssertEqual(index!, randomIndex)
            XCTAssertEqual(array[index!], testValue)
        }
    }
    
    func testLowerBound() {
        let index = binarySearch(search, key: 1)
        XCTAssertNotNil(index)
        XCTAssertEqual(index!, 0)
        XCTAssertEqual(search[index!], 1)
    }
    
    func testUpperBound() {
        let index = binarySearch(search, key: 500)
        XCTAssertNotNil(index)
        XCTAssertEqual(index!, 499)
        XCTAssertEqual(search[index!], 500)
    }
    
    func testOutOfLowerBound() {
        let index = binarySearch(search, key: 0)
        XCTAssertNil(index)
    }
    
    func testOutOfUpperBound() {
        let index = binarySearch(search, key: 501)
        XCTAssertNil(index)
    }
    
}