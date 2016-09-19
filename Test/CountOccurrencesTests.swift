//
//  CountOccurrencesTests.swift
//  SwiftStructure
//
//  Created by Ahmed Onawale on 9/18/16.
//  Copyright © 2016 Ahmed Onawale. All rights reserved.
//

import Foundation
import XCTest

class CountOccurencesTest: XCTestCase {
    
    func testEmptyArray() {
        let count = countOccurrencesOfKey(3, inArray: [])
        XCTAssertEqual(count, 0)
    }
    
    func testCountOccurences() {
        let a = [0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11]
        let count = countOccurrencesOfKey(3, inArray: a)
        XCTAssertEqual(count, 4)
    }
    
}